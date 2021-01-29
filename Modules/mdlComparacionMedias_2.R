comparacionMediasUI_2 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  radioButtons(ns('hypAlter'), label = 'Hipótesis alternativa',
                               choices = list('\\(H_1\\!\\!: \\,\\bar{x}_1 \\neq \\bar{x}_2\\)' = 'two.sided', 
                                              '\\(H_1\\!\\!: \\,\\bar{x}_1 < \\bar{x}_2\\)' = 'less', 
                                              '\\(H_1\\!\\!: \\,\\bar{x}_1 > \\bar{x}_2\\)' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  materialSwitch(ns('paired'), label = 'Muestras emparejadas', value = FALSE, status = "primary"),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, uiOutput(ns('t_test2samples'))))
}

comparacionMediasServer_2 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
##  
  output$selectSeries <- renderUI(selectizeInput(session$ns("selectedSeries"), label = 'Seleccione 2 conjuntos de datos', 
                                                 options = list(maxItems = 2), 
                                                 #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                                 choices = values[1:nSeries()]))
  dataF1 <- eventReactive(input$doCompare, compl[[input$selectedSeries[1]]]$data()[, 1])
  dataF2 <- eventReactive(input$doCompare, compl[[input$selectedSeries[2]]]$data()[, 1])
  
  T2 <- eventReactive(input$doCompare, {
    t.test(x = dataF1(), y = dataF2(), alternative = input$hypAlter, conf.level = input$ConfLev, paired = input$paired)})
  
  t_test2samples <- eventReactive(input$doCompare, {
    if(T2()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.', tags$br(), 
                                    tags$b('Conclusión: La media muestral del primer conjunto ', cnclsn(input$hypAlter, 'smpl'))),
                 tags$h4('La diferencia entre las medias muestrales es estadísticamente significativa al nivel de confianza
                         del ', round(100 * input$ConfLev, 1), '%.'),
                 tags$br(), tableOutput(session$ns("tableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.', tags$br(), 
                                    tags$b('Conclusión: La media muestral del primer conjunto no ', cnclsn(input$hypAlter, 'smpl'))),
                 tags$h4('Al nivel de confianza del ', round(100 * input$ConfLev, 1), '%, 
                          no hay evidencia suficiente para afirmar que la diferencia
                         entre las medias muestrales se deba a algo más que no sea mero error aleatorio.'), 
                 tags$br(), tableOutput(session$ns("tableResults"))))
    }
  })

  tableResults <- eventReactive(input$doCompare, {
    if (!input$paired) {
      return(data.frame('Datos prueba' = c('Estadístico t', 'Grados de libertad',
                                           'Valor p', 'Diferencia de la medias', 'Error estándar de la diferencia', 
                                           'Intervalo de confianza de la diferencia:', 
                                           '~, límite inferior', '~, límite superior', 'Nivel de confianza (%)'), 
               'Valor' = c(T2()$statistic, T2()$parameter, T2()$p.value, T2()$estimate[1] - T2()$estimate[2], 
                           T2()$stderr, NA, T2()$conf.int[1], T2()$conf.int[2], 
                           (input$ConfLev * 100))))
    } else {  
      return(data.frame('Datos prueba' = c('Estadístico t', 'Grados de libertad',
                                           'Valor p', 'Media de las diferencias', 'Error estándar de la media de diferencias', 
                                           'Intervalo de confianza de la media de diferencias:', 
                                           '~, límite inferior', '~, límite superior', 'Nivel de confianza (%)'), 
                        'Valor' = c(T2()$statistic, T2()$parameter, 
                                    T2()$p.value, T2()$estimate, T2()$stderr, NA, 
                                    T2()$conf.int[1], T2()$conf.int[2], (input$ConfLev * 100))))
    }})
  
  output$tableResults <- renderTable(tableResults())
  output$t_test2samples <- renderUI(t_test2samples())
}