comparacionANOVAUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('anova1'))))
}

comparacionANOVAServer <- function(input, output, session, nSeries, compl, formatP, dimensP) {
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
  return(list('aovSum' = anovaReac, 'aovSig' = reactive(input$ConfLev)))
}



comparacionRanMulUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(12, actionButton(ns('doCompare'), label = "Analizar datos de ANOVA", styleclass = 'primary'), tags$hr()),
           column(4, box(title = tags$b('Prueba de diferencia significativa mínima de Fisher'), width = 12, height = 900,
                         tags$br(), verbatimTextOutput(ns('LSDFTest')), tags$br(), plotOutput(ns('LSDFPlot')))),
           column(4, box(title = tags$b('Prueba de diferencias significativas de Tukey'), width = 12, height = 900,
                         tags$br(), verbatimTextOutput(ns('TukeyTest')), tags$br(), plotOutput(ns('TukeyPlot')))),
           column(4, box(title = tags$b('Prueba de rangos múltiples de Duncan'), width = 12, height = 900, 
                         h5('Esto como se interpreta?'),
                         tags$br(), verbatimTextOutput(ns('DuncanTest')), tags$br(), plotOutput(ns('DuncanPlot')))))
}

comparacionRanMulServer <- function(input, output, session, aovModel) {
  #aovModel <- reactive(aovModel)
  observeEvent(input$doCompare, {
    LSDFReac <- reactive(agricolae::LSD.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    output$LSDFTest <- renderPrint(summary(LSDFReac()))
    output$LSDFPlot <- renderPlot(plot(LSDFReac(), main = ''))
    
    TukeyReac <- reactive(TukeyHSD(x = aovModel$aovSum(), conf.level = aovModel$aovSig()))
    output$TukeyTest <- renderPrint(TukeyReac())
    output$TukeyPlot <- renderPlot(plot(TukeyReac()))
    
    DuncanReac <- reactive(agricolae::duncan.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    output$DuncanTest <- renderPrint(summary(DuncanReac()))
    output$DuncanPlot <- renderPlot(plot(DuncanReac()))
  })
}
