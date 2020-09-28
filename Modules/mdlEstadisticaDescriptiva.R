estadisticaDescriptivaUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)
  box(width = 12, 
  fluidRow(column(3, box(title = '', width = 12,  status = 'primary',
                         uiOutput(ns('selectSeries')),
                         selectizeInput(ns('valX'), label = "Variable para describir", width = '80%',
                                        choices = list('col.X1' = 1, 'col.X2' = 2, 'col.X3' = 3, 'col.X4' = 4)),
                         actionButton(ns("descrStat"), label = 'Calcular descriptores estadísticos', styleclass = 'primary'),
                         tableOutput(ns('dataseries')))),
            column(3, box(title = tags$b("Descriptores estadísticos"), width = 12,  status = 'primary',
                          htmlOutput(ns('Descriptores')))),
            column(3, box(title = tags$b('Pruebas de normalidad'), status = 'warning',  width = 12, 
                          plotOutput(ns('DiagramaPP')), 
                          box(title = 'Prueba de Wilkinson', htmlOutput(ns('niceWilkinson'))),
                          box(title = 'Prueba de Kolmogorov-Smirnof', htmlOutput(ns('niceKolmoSmir'))))),
            column(3, box(title = tags$b('Posibles anómalos'), status = 'warning',  width = 12, 
                          box(title = 'Prueba de Grubbs', width = 12, htmlOutput(ns('niceGrubs'))),
                          box(title = 'Prueba de Dixon', width = 12, htmlOutput(ns('niceDixon')))))
  ))
}

estadisticaDescriptivaServer <- function(input, output, session, nSeries, compl, configDwn) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  
  dataF <- eventReactive(input$descrStat, compl[[input$selectedSeries]]$data()[, as.numeric(input$valX)])
  
  output$dataseries <- renderTable(dataF())
  
  dscrptX1 <- reactive(paste0("Promedio = ", signif(mean(dataF()), 4), "<br />",
                              "Desv. Estándar = ", signif(sd(dataF()), 4), "<br />",
                              "Desviación estándar relativa = ", signif(sd(dataF())/mean(dataF()), 4), "<br />",
                              "Número de datos = ", nrow(dataF()),  "<br />",
                              "Mediana", signif(median(dataF()), 4)))
  #dscrptX1 <- reactive(paste0(str(series$data())))
  output$Descriptores <- renderText(dscrptX1())
  
  
  
  #return(reactive(list(data = na.rm(MyChanges()), name = input$seriesName(), descr = input$dataDescrip)))
}
