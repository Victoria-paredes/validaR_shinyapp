importarDatosUI <- function(id, IntID = 2, value0 = 10) {
  ns <- NS(id)

  box(title = paste0("Módulo de importación de datos. Serie #", IntID), width = 12, #solidHeader = TRUE, status = 'primary',
      fluidRow(column(4, fileInput(ns("importedFile"), label = 'Archivo con datos', multiple = FALSE, accept = '.csv', 
                                   buttonLabel = 'Cargar', placeholder = 'Solo archivos .csv')),
               column(8, textInput(ns('seriesName'), label = 'Identificador de la serie',
                                   placeholder = 'Valores alfanuméricos sin espacios ni caracteres especiales...')))
      )
}

importarDatosServer <- function(input, output, session) {

}
#Mirar https://mastering-shiny.org/action-transfer.html Sección 9.3