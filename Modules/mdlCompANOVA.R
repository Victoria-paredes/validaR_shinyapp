comparacionANOVAUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  sliderInput(ns('signif'), label = 'Seleccione la significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('anova1'))))
}

comparacionANOVAServer <- function(input, output, session, nSeries, compl) {
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
  return(list('aovSum' = anovaReac))
}



comparacionRanMulUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, actionButton(ns('doCompare'), label = "Pruebas", styleclass = 'primary'),
                  sliderInput(ns('signif'), label = 'Seleccione la significancia de la prueba', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  box(title = tags$b('Prueba de diferencias significativas de Tukey'), width = 12, height = 400,
                      verbatimTextOutput(ns('TukeyTest')),
                      plotOutput(ns('TukeyPlot')))))
}

comparacionRanMulServer <- function(input, output, session, aovModel) {
  #aovModel <- reactive(aovModel)
  observeEvent(input$doCompare, {
    TukeyReac <- reactive(TukeyHSD(x = aovModel$aovSum(), conf.level = input$signif))
    output$TukeyTest <- renderPrint(TukeyReac())
    output$TukeyPlot <- renderPlot(plot(TukeyReac()))
  })
}
