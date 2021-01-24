comparacionANCOVAUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  selectInput(ns("selCovariate"), label = 'Seleccione la columna con la covariable', 
                              choices = list('var.X2' = 2, 'var.X2' = 2, 'var.X2' = 2), width = '100%'),
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('ancova1'))))
}

comparacionANCOVAServer <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(
    pickerInput(session$ns("selectedSeries"), label = 'Seleccione conjuntos de datos', 
                choices = values[1:nSeries()], width = '100%', inline = FALSE,
                options = list(`actions-box` = TRUE, size = 10, #`selected-text-format` = "count > 3",
                               `deselect-all-text` = "Deseleccionar todos", `select-all-text` = "Seleccionar todos",
                               `none-selected-text` = "(Al menos tres)"),
                multiple = TRUE))
  
  complClean <- reactiveValues()
  observe(
    for (i in input$selectedSeries) {
      complClean[[i]] <- compl[[i]]$data()[, 1]
    }
  )
  
  anovaReac <- eventReactive(input$doCompare, {
    aov(formula = values ~ ind, data = stack(isolate(reactiveValuesToList(complClean))))
  })
  
  output$anova1 <- renderPrint(summary(anovaReac()))
  return(list('aovSum' = anovaReac, 'aovSig' = reactive(input$signif)))
}


