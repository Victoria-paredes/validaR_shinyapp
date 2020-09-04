comparacionMediasUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, uiOutput(ns('selectSeries'))), 
           column(2, numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Hipótesis alternativa',
                               choices = list('bar{x} neq mu_0' = 1, 'bar{x} < mu_0' = 2, 'bar{x} > mu_0' = 3)), 
                  sliderInput(ns('signif'), label = 'Seleccione la significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001)))
}

comparacionMediasServer_1 <- function(input, output, session, nSeries, compl) {
  values <- as.list(1:20)
  names(values) <- paste('Serie', 1:20)
  
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione la serie de datos a comparar',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
}

comparacionMediasUI_2i <- function(id) {
  
}

comparacionMediasServer_2i <- function(input, output, session) {
  
}

comparacionMediasUI_2p <- function(id) {
  
}

comparacionMediasServer_2p <- function(input, output, session) {
  
}