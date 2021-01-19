estadisticaDescriptivaUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)
  #box(width = 12, 
  fluidRow(column(12, 
                  box(width = 3,  status = 'primary', title = tags$b('Datos para analizar'),
                      uiOutput(ns('selectSeries')),
                      selectizeInput(ns('valX'), label = "Seleccione una variable", width = '80%',
                                     choices = list('col.X1' = 1, 'col.X2' = 2, 'col.X3' = 3, 'col.X4' = 4)),
                      sliderInput(ns('ConfLev'), label = 'Nivel de confianza para las pruebas de normalidad y de datos anómalos:', 
                                  min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                      shiny::actionButton(ns("descrStat"), label = 'Calcular descriptores estadísticos', styleclass = 'primary')#,
                      #tableOutput(ns('dataseries'))
                      ),
                  box(title = tags$b("Descriptores estadísticos"), width = 3,  status = 'primary', 
                      tableOutput(ns('descripTab'))),
                  tabBox(title = tags$b("Diagramas"), width = 6,
                         tabPanel("Histograma", 
                                  dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                                 tooltip = tooltipOptions(title = "Configuraciones del gráfico"),
                                                 sliderInput(ns("bins"), label = 'Número de barras', min = 3, max = 40, 
                                                             value = 10, width = '80%'),
                                                 textInput(ns('xlabHs'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('histogramPlt')),
                                  downloadButton(ns('DwnhistogramPlt'), label = 'Descargar gráfico')),
                         tabPanel("Puntos apilados", 
                                  dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                                 tooltip = tooltipOptions(title = "Configuraciones del gráfico"),
                                                 textInput(ns('xlabSt'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('stackedDot')),
                                  downloadButton(ns('DwnstackedDot'), label = 'Descargar gráfico')),
                         tabPanel("Normalidad (Q-Q)", 
                                  dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                                 tooltip = tooltipOptions(title = "Configuraciones del gráfico"),
                                                 textInput(ns('xlabQQ'), label = 'Etiqueta eje X', 
                                                           value = 'Valor teórico normalizado'),
                                                 textInput(ns('ylabQQ'), label = 'Etiqueta eje X', 
                                                           value = 'Valor experimental')),
                                  #dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                  #               tooltip = tooltipOptions(title = "Etiquetas de eje"),
                                  #               textInput(ns('xlabSt'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('DiagramaQQ')),
                                  downloadButton(ns('DwnDiagramaQQ'), label = 'Descargar gráfico')))),
           
          column(6, tabBox(title = tags$b('Pruebas de normalidad'), width = 12, height = '400px',
                            tabPanel("Shapiro-Wilk", htmlOutput(ns('niceShapWilk'))),
                            tabPanel("Kolmogorov-Smirnof", htmlOutput(ns('niceKolmoSmir'))))),
          column(6, tabBox(title = tags$b('Pruebas de datos anómalos'), width = 12, height = '400px',
                           tabPanel("Criterios de Grubbs", 
                                    htmlOutput(ns('niceGrubs10')), htmlOutput(ns('niceGrubs11')), htmlOutput(ns('niceGrubs20'))),
                           tabPanel("Criterio de Dixon", htmlOutput(ns('niceDixon')))))
  )#)
}

estadisticaDescriptivaServer <- function(input, output, session, nSeries, compl, formatP, dimensP) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  
  dataF <- eventReactive(input$descrStat, compl[[input$selectedSeries]]$data()[, as.numeric(input$valX)])
  
  descripTabRc <- reactive(data.frame(Estadístico = c("Promedio", "Desv. Estándar", "Desv. estándar relativa (%)", "",
                                                          "Mediana", "Número de datos", "Valor mínimo", "Valor máximo", "Rango"), 
                                           Valor = c(signif(mean(dataF()), 4), signif(sd(dataF()), 4), 
                                                     signif(sd(dataF())/mean(dataF()) * 100, 4), NA, signif(median(dataF()), 4), 
                                                     length(dataF()), min(dataF()), max(dataF()), (max(dataF()) - min(dataF())))))
  
  histogramPlt <-  reactive({
    p <- ggplot(data = data.frame(x = dataF()), aes(x)) + theme_bw() +
      geom_histogram(bins = input$bins, aes(y = ..density..), color = "grey30", fill = "white") +
      geom_density(fill = '#97d7e4', alpha = 0.4) + labs(y = 'Densidad', x = input$xlabHs) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            axis.text.x = element_text(color = "black"), axis.text.y = element_text(color = "black"))
    return(p)
  })
  
  stackedDot <-  reactive({dotPlot(dataF(), xlab = input$xlabSt, pch = 16, frame = TRUE)})
  
  DiagramaQQ <-  reactive({
    p <- ggplot(data = data.frame(x = dataF())) + theme_bw() + geom_qq(aes(sample = x)) +
      geom_abline(slope = sd(dataF()), intercept = mean(dataF()), col = 'blue') + 
      labs(y = input$ylabQQ, x = input$xlabQQ) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            axis.text.x = element_text(color = "black"), axis.text.y = element_text(color = "black"))
    return(p)
  })
  
  niceShapWilk <- reactive({
    SW <- shapiro.test(dataF())
    SWtx <- ifelse(SW$p.value <= (1 - input$ConfLev),
                   'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                   'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(SWtx, tags$b(pround(SW$p.value, digits = 4))))})
  
  niceKolmoSmir <- reactive({
    KS <- ks.test(dataF(), y = 'pnorm')
    KStx <- ifelse(KS$p.value <= (1 - input$ConfLev),
                   'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                   'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(KStx, tags$b(pround(KS$p.value, digits = 4))))})
  
  niceGrubs10 <- reactive({
    Gr10 <- outliers::grubbs.test(dataF(), type = 10)
    Gr10tx <- ifelse(Gr10$p.value <= (1 - input$ConfLev),
                   'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                   'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(Gr10tx, tags$b(pround(Gr10$p.value, digits = 4))))})
  
  niceGrubs11 <- reactive({
    Gr11 <- outliers::grubbs.test(dataF(), type = 11)
    Gr11tx <- ifelse(Gr11$p.value <= (1 - input$ConfLev),
                     'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                     'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(Gr11tx, tags$b(pround(Gr11$p.value, digits = 4))))})
  
  niceGrubs20 <- reactive({
    Gr20 <- outliers::grubbs.test(dataF(), type = 20)
    Gr20tx <- ifelse(Gr20$p.value <= (1 - input$ConfLev),
                     'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                     'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(Gr20tx, tags$b(pround(Gr20$p.value, digits = 4))))})
  
  niceDixon <- reactive({
    Dix <- outliers::dixon.test(dataF())
    Dixtx <- ifelse(Dix$p.value <= (1 - input$ConfLev),
                     'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                     'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(Dixtx, tags$b(pround(Dix$p.value, digits = 4))))})
  
  output$descripTab     <- renderTable(descripTabRc())
  output$histogramPlt   <- renderPlot(histogramPlt())
  output$stackedDot     <- renderPlot(stackedDot())
  output$DiagramaQQ     <- renderPlot(DiagramaQQ())
  output$niceShapWilk   <- renderPrint(niceShapWilk())
  output$niceKolmoSmir  <- renderPrint(niceKolmoSmir())
  output$niceGrubs10    <- renderPrint(niceGrubs10())
  output$niceGrubs11    <- renderPrint(niceGrubs11())
  output$niceGrubs20    <- renderPrint(niceGrubs20())
  output$niceDixon      <- renderPrint(niceDixon())
  
  output$DwnhistogramPlt <- dwldhndlr(name = 'Histograma', formatP = formatP, dimensP = dimensP, plt = histogramPlt())
  output$DwnstackedDot   <- dwldhndlr(name = 'PuntosApilados', formatP = formatP, dimensP = dimensP, plt = stackedDot())
  output$DwnDiagramaQQ   <- dwldhndlr(name = 'cuartilCuartil', formatP = formatP, dimensP = dimensP, plt = DiagramaQQ())
  
  #return(reactive(list(data = na.rm(MyChanges()), name = input$seriesName(), descr = input$dataDescrip)))
}
