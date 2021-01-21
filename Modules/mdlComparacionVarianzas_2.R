comparacionVarianUI_2 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('\\(H_1\\!\\!: S^2_1  \\neq S^2_2\\)' = 'two.sided', 
                                              '\\(H_1\\!\\!: S^2_1 < S^2_2\\)' = 'less', 
                                              '\\(H_1\\!\\!: S^2_1 > S^2_2\\)' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, uiOutput(ns('F_test2sample'))))
}

comparacionVarianServer_2 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectizeInput(session$ns("selectedSeries"), label = 'Seleccione 2 conjuntos de datos', 
                                                 options = list(maxItems = 2), 
                                                 #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                                 choices = values[1:nSeries()]))
  
  F2 <- eventReactive(input$doCompare, {
    var.test(x = compl[[input$selectedSeries[1]]]$data()[, 1],
             y = compl[[input$selectedSeries[2]]]$data()[, 1],
             alternative = input$hypAlter, 
             conf.level = input$ConfLev)})
  
  F_test2sample <- eventReactive(input$doCompare, {
    if(F2()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("tableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("tableResults"))))
    }})
  
  tableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico F', 'Grados de libertad', '~, numerador', '~, denominador',
                                  'Valor p', 'Relación de varianzas', 'Intervalo de confianza:', 
                                  '~, límite inferior', '~, límite superior', 'Nivel de confianza (%)'), 
               'Valor' = c(F2()$statistic, NA, F2()$parameter[1], F2()$parameter[2], F2()$p.value, F2()$estimate, NA, 
                           F2()$conf.int[1], F2()$conf.int[2], (input$ConfLev * 100))))
  
  output$tableResults <- renderTable(tableResults())
  output$F_test2sample <- renderUI(F_test2sample())
}