configDwnFilesUI <- function(id) {
  ns <- NS(id)
  fluidRow(box(title = tags$b('Archivos de imagen (gráficos)'), status = 'primary', width = 3,
               radioButtons(ns("format.img"), label = "Formato del archivo",
                            choices = list("PDF (Gráfico vectorizado)" = ".pdf", "PNG (mapa de bits de 300 ppi)" = ".png")),
               sliderInput(ns("plotsW"), label = "Anchura (mm)", min = 40, max = 300, value = 80),
               sliderInput(ns("plotsH"), label = "Altura (mm)", min = 40, max = 300, value = 60)),
           
           actionButton(ns('refreshConf'), label = 'Actualizar configuraciones', styleclass = 'warning'))
  
}

configDwnFilesServer <- function(input, output, session, nSeries, compl) {
  bigOlFormat <- eventReactive(input$refreshCof, {
    list(format.img = input$format.img, size.img = c(input$plotsW, input$plotsH))})

    return(bigOlFormat)
}
