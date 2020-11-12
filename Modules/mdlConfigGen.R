configGenUI <- function(id) {
  ns <- NS(id)
  fluidRow(box(title = tags$b('Archivos de imagen'), status = 'primary', width = 3, height = 340,
               radioButtons(ns("format.img"), label = "Formato del archivo",
                            choices = list("PDF (Gráfico vectorizado)" = ".pdf", "PNG (mapa de bits de 300 ppi)" = ".png")),
               sliderInput(ns("plotsW"), label = "Anchura (mm)", min = 40, max = 300, value = 80),
               sliderInput(ns("plotsH"), label = "Altura (mm)", min = 40, max = 300, value = 60)),
           box(title = tags$b('Tablas de ingreso de datos'), status = 'warning', width = 3, height = 340,
               sliderInput(ns("nCols"), label = "Máximo de filas", min = 10, max = 100, value = 15),
               sliderInput(ns("nRows"), label = "Máximo de columnas", min = 4, max = 10, value = 4)),
           box(title = tags$b(''), status = 'danger', width = 6, height = 340),
           column(5),
           actionBttn(ns('refreshConf'), label = "Actualizar configuraciones", style = "material-flat", 
                      color = "success",icon = icon("cog")))
  
}

configGenServer <- function(input, output, session, nSeries, compl) {
  bigOlFormat <- eventReactive(input$refreshCof, {
    list(format.img = input$format.img, size.img = c(input$plotsW, input$plotsH),
         size.DatTa = c(input$nCols, input$nRows))})

  
    return(bigOlFormat)
}
