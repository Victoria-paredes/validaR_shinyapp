comparacionMediasUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('H1: bar{x} neq \\(\\mu_0\\)' = 'two.sided', 
                                              'H1: bar{x} < mu_0' = 'less', 
                                              'H1: bar{x} > mu_0' = 'greater')), 
                  sliderInput(ns('signif'), label = 'Significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('t_test1sample'))))
}

comparacionMediasServer_1 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  observeEvent(input$doCompare, {
    output$t_test1sample <- renderPrint(t.test(x = compl[[input$selectedSeries]]$data()[, 1],
                                               alternative = input$hypAlter, 
                                               mu = input$valRef,
                                               conf.level = input$signif))
  })
}

comparacionMediasUI_2 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('H1: bar{x} neq \\(\\mu_0\\)' = 'two.sided', 
                                              'H1: bar{x} < mu_0' = 'less', 
                                              'H1: bar{x} > mu_0' = 'greater')), 
                  sliderInput(ns('signif'), label = 'Significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  checkboxInput(ns('paired'), label = 'Muestras emparejadas', value = FALSE),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('t_test2samples'))))
}

comparacionMediasServer_2 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectizeInput(session$ns("selectedSeries"), label = 'Seleccione 2 conjuntos de datos', 
                                                 options = list(maxItems = 2), 
                                                 #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                                 choices = values[1:nSeries()]))
  observeEvent(input$doCompare, {
    output$t_test2samples <- renderPrint(t.test(x = compl[[input$selectedSeries[1]]]$data()[, 1],
                                               y = compl[[input$selectedSeries[2]]]$data()[, 1],
                                               alternative = input$hypAlter, 
                                               conf.level = input$signif,
                                               paired = input$paired))
  })
}
