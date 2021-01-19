comparacionVarianUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 1),
                  radioButtons(ns('refUnits'), label = NULL, width = '100%', selected = 3,
                              choices = list("Unidades de varianza" = 1, 
                                             "Desviación estandar" = 2,
                                             "Desviación estándar relativa (%)" = 3)),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('H1: bar{x} neq \\(\\mu_0\\)' = 'two.sided', 
                                              'H1: bar{x} < mu_0' = 'less', 
                                              'H1: bar{x} > mu_0' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('chi_test1sample'))))
}

comparacionVarianServer_1 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  sigma.squared <- reactive(
    if(input$refUnits == 1) {return(input$valRef)} else {
      if(input$refUnits == 2) {return(input$valRef^2)} else {
        if(input$refUnits == 3) {return((input$valRef / 100 * mean(compl[[input$selectedSeries]]$data()[, 1]))^2)}}}
  )
  observeEvent(input$doCompare, {
    output$chi_test1sample <- renderPrint(EnvStats::varTest(x = compl[[input$selectedSeries]]$data()[, 1],
                                                          alternative = input$hypAlter, 
                                                          sigma.squared = sigma.squared(),
                                                          conf.level = input$ConfLev))
  })
}

comparacionVarianUI_2 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('H1: bar{x} neq \\(\\mu_0\\)' = 'two.sided', 
                                              'H1: bar{x} < mu_0' = 'less', 
                                              'H1: bar{x} > mu_0' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, verbatimTextOutput(ns('F_test2sample'))))
}

comparacionVarianServer_2 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectizeInput(session$ns("selectedSeries"), label = 'Seleccione 2 conjuntos de datos', 
                                                 options = list(maxItems = 2), 
                                                 #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                                 choices = values[1:nSeries()]))
  observeEvent(input$doCompare, {
    output$F_test2sample <- renderPrint(var.test(x = compl[[input$selectedSeries[1]]]$data()[, 1],
                                                 y = compl[[input$selectedSeries[2]]]$data()[, 1],
                                                 alternative = input$hypAlter, 
                                                 conf.level = input$ConfLev))})
}

comparacionVarianUI_m <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, 
                  uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(10, box(title = tags$b('Prueba de Barlett'), status = 'primary', width = 6, height = 250, 
                          verbatimTextOutput(ns('outBarlett'))),
                  box(title = tags$b('Prueba de Levene'), status = 'primary', width = 6, height = 250, 
                      radioButtons(ns('leveneLocation'), label = 'Localizador central', inline = TRUE,
                                   choices = list('Mediana' = 'median', 'Media' = 'mean')),
                      verbatimTextOutput(ns('outLevene')), 
                      h4("Revisar los resultados de esta prueba...")),
                  box(title = tags$b('Prueba Fmax de Hartley'), status = 'primary', width = 6, height = 450, 
                      verbatimTextOutput(ns('outHartley')), 
                      h4("Revisar los resultados de esta prueba...")),
                  box(title = tags$b('Varianzas anómalas: Prueba de Cochran'), status = 'primary', width = 6, height = 450, 
                      radioButtons(ns('coch.Inly'), label = 'Valor sospechoso', inline = TRUE,
                                   choices = list('Varianza más grande' = FALSE, 'Varianza más pequeña' = TRUE)),
                      verbatimTextOutput(ns('outCochran')))))
}

comparacionVarianServer_m <- function(input, output, session, nSeries, compl) {
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
  observeEvent(input$doCompare, {
    output$outBarlett <- renderPrint(bartlett.test(x = isolate(reactiveValuesToList(complClean))))
    output$outLevene <- renderPrint(car::leveneTest(data = stack(isolate(reactiveValuesToList(complClean))),
                                                    y = values ~ ind, center = input$leveneLocation))
    output$outHartley <- renderPrint(PMCMRplus::hartleyTest(formula = values ~ ind, 
                                                            data = stack(isolate(reactiveValuesToList(complClean)))))
    output$outCochran <- renderPrint(outliers::cochran.test(data = stack(isolate(reactiveValuesToList(complClean))),
                                                            object = values ~ ind, inlying = input$coch.Inly))
  })
}
