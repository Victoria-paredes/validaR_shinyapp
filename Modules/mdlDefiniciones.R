

definicionesUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, pickerInput(ns("trm"), label = "Buscar término", choices = nomConceptos, selected = 0, multiple = TRUE, 
                                 options = list(`live-search` = TRUE,
                                                `none-selected-text` = 'Escriba una opción...',
                                                `none-results-text` = 'Sin resultados...'))),
           column(10, uiOutput(ns('definicion'))))
}

definicionesServer <- function(input, output, session) {
  output$definicion <- renderUI(if(input$trm == 0) conceptos else conceptos[[as.numeric(input$trm)]])
}

