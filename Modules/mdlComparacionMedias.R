comparacionMediasUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, uiOutput(ns('selectSeries')),
                  numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('H1: bar{x} neq \\(\\mu_0\\)' = 'two.sided', 
                                              'H1: bar{x} < mu_0' = 'less', 
                                              'H1: bar{x} > mu_0' = 'greater')), 
                  sliderInput(ns('signif'), label = 'Seleccione la significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Hacer inferencia", styleclass = 'primary', block = TRUE)),
           column(4, verbatimTextOutput(ns('t_test1sample'))))
}

comparacionMediasServer_1 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Serie de datos a comparar',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  observeEvent(input$doCompare, {
    output$t_test1sample <- renderPrint(t.test(x = compl[[input$selectedSeries]]$data()[, 1],
                                               alternative = input$hypAlter, 
                                               mu = input$valRef,
                                               conf.level = input$signif))
  })
}

comparacionMediasUI_2i <- function(id) {
  
}

comparacionMediasServer_2i <- function(input, output, session) {
  
}

comparacionMediasUI_2p <- function(id) {
  
}

comparacionMediasServer_2p <- function(input, output, session) {
  
}