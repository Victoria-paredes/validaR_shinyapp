definicionesUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, searchInput(inputId = "id", label = "Buscar concepto :", placeholder = "Escribir búsqueda...",
                                 btnSearch = icon("search"), btnReset = icon("remove"), width = "100%"),
                  h6('Módulo de búsqueda está pendiente por implementar...')),
           column(10, trmIndicacion, trmIndicacionDeBlanco))
}

definicionesServer <- function(input, output, session) {

}

