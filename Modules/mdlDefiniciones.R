

definicionesUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, pickerInput(ns("trm"), label = "Buscar término", choices = nomConceptos, selected = 0,
                                 options = list(`live-search` = TRUE))),
           column(10, uiOutput(ns('definicion'))))
}

definicionesServer <- function(input, output, session) {
  output$definicion <- renderUI(if(input$trm == 0) conceptos else conceptos[[as.numeric(input$trm)]])
}

