comparacionVarianUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 1),
                  radioButtons(ns('refUnits'), label = NULL, width = '100%', selected = 3,
                              choices = list("Unidades de varianza" = 1, 
                                             "Desviación estandar" = 2,
                                             "Desviación estándar relativa (%)" = 3)),
                  radioButtons(ns('hypAlter'), label = 'Seleccione hipótesis alternativa',
                               choices = list('\\(H_1\\!\\!: S^2 \\neq \\sigma^2\\)' = 'two.sided', 
                                              '\\(H_1\\!\\!: S^2 < \\sigma^2\\)' = 'less', 
                                              '\\(H_1\\!\\!: S^2 > \\sigma^2\\)' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, uiOutput(ns('chi_test1sample'))))
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
  Chi2 <- eventReactive(input$doCompare, {
    EnvStats::varTest(x = compl[[input$selectedSeries]]$data()[, 1], alternative = input$hypAlter, 
                      sigma.squared = sigma.squared(), conf.level = input$ConfLev)})
  
  chi_test1sample <- eventReactive(input$doCompare, {
    if(Chi2()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La diferencia entre la varianza muestral y el valor de referencia es estadísticamente significativa
                         al nivel de confianza del ', round(100 * input$ConfLev, 1), '%.'),
                 tags$br(), tableOutput(session$ns("tableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('Al nivel de confianza del ', round(100 * input$ConfLev, 1), '%,
                          no hay evidencia suficiente para afirmar que la diferencia
                         entre la varianza muestral y el valor de referencia,
                         se deba a algo más que no sea mero error aleatorio.'), 
                 tags$br(), tableOutput(session$ns("tableResults"))))
    }})
  
  tableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico \\(\\chi^2\\)', 'Grados de libertad',
                                  'Valor p', 'Varianza muestral', 'Intervalo de confianza:', 
                                  '~, límite inferior', '~, límite superior', 'Nivel de confianza (%)'), 
               'Valor' = c(Chi2()$statistic, Chi2()$parameters, Chi2()$p.value, Chi2()$estimate, NA, 
                           Chi2()$conf.int[1], Chi2()$conf.int[2], (input$ConfLev * 100))))
  
  output$tableResults <- renderTable(tableResults())
  output$chi_test1sample <- renderUI(chi_test1sample())
}