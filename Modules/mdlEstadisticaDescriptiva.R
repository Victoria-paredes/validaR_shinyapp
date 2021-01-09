estadisticaDescriptivaUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)
  box(width = 12, 
  fluidRow(column(12, 
                  box(width = 3,  status = 'primary',
                      uiOutput(ns('selectSeries')),
                      selectizeInput(ns('valX'), label = "Variable para describir", width = '80%',
                                     choices = list('col.X1' = 1, 'col.X2' = 2, 'col.X3' = 3, 'col.X4' = 4)),
                      actionButton(ns("descrStat"), label = 'Calcular descriptores estadísticos', styleclass = 'primary')#,
                      #tableOutput(ns('dataseries'))
                      ),
                  box(title = tags$b("Descriptores estadísticos"), width = 3,  status = 'primary', 
                      tableOutput(ns('descripTab'))),
                  tabBox(title = tags$b("Diagramas"), width = 6,
                         tabPanel("Histograma", 
                                  sliderInput(ns("bins"), label = 'Número de barras', min = 2, max = 20, value = 5, width = '80%'),
                                  dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                                 tooltip = tooltipOptions(title = "Etiquetas de eje"),
                                                 textInput(ns('xlabHs'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('histogramPlt')),
                                  downloadButton(ns('DwnhistogramPlt'), label = 'Descargar gráfico')),
                         tabPanel("Puntos apilados", 
                                  dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                                 tooltip = tooltipOptions(title = "Etiquetas de eje"),
                                                 textInput(ns('xlabSt'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('stackedDot')),
                                  downloadButton(ns('DwnstackedDot'), label = 'Descargar gráfico')),
                         tabPanel("Normalidad (P-P)", 
                                  #dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                  #               tooltip = tooltipOptions(title = "Etiquetas de eje"),
                                  #               textInput(ns('xlabSt'), label = 'Etiqueta eje X', value = 'Variable')),
                                  plotOutput(ns('DiagramaPP')),
                                  downloadButton(ns('DwnDiagramaPP'), label = 'Descargar gráfico')))),
           
          column(6, tabBox(title = tags$b('Pruebas de normalidad'), width = 12, 
                            tabPanel("Prueba de Shapiro-Wilk", htmlOutput(ns('niceWilkinson'))),
                            tabPanel("Prueba de Kolmogorov-Smirnof", htmlOutput(ns('niceKolmoSmir'))))),
          column(6, tabBox(title = tags$b('Pruebas de datos anómalos'), width = 12,
                           tabPanel("Criterios de Grubbs", htmlOutput(ns('niceGrubs'))),
                           tabPanel("Criterio de Dixon")))
  ))
}

estadisticaDescriptivaServer <- function(input, output, session, nSeries, compl, configDwn) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  
  dataF <- eventReactive(input$descrStat, compl[[input$selectedSeries]]$data()[, as.numeric(input$valX)])
  
  descripTabRc <- reactive(data.frame(Estadístico = c("Promedio", "Desv. Estándar", "Desv. estándar relativa",
                                                          "Mediana", "Número de datos"), 
                                           Valor = c(signif(mean(dataF()), 4), signif(sd(dataF()), 4), 
                                                     signif(sd(dataF())/mean(dataF()), 4), signif(median(dataF()), 4), 
                                                     length(dataF()))))
  
  histogramPlt <-  reactive({
    p <- ggplot(data = data.frame(x = dataF()), aes(x)) + theme_bw() + geom_histogram(bins = input$bins) +
      labs(y = 'Frecuencia', x = input$xlabHs) +# (mg k', g^{-1}, ')'))) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            axis.text.x = element_text(color = "black"), axis.text.y = element_text(color = "black"))
    return(p)
  })
  
  stackedDot <-  reactive({dotPlot(dataF(), xlab = input$xlabSt, pch = 16, frame = TRUE)})
  
  output$descripTab <- renderTable(descripTabRc())
  output$histogramPlt <- renderPlot(histogramPlt())
  output$stackedDot <- renderPlot(stackedDot())
  
  #return(reactive(list(data = na.rm(MyChanges()), name = input$seriesName(), descr = input$dataDescrip)))
}
