comparacionMediasUI_1 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  numericInput(ns('valRef'), label = 'Valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Hipótesis alternativa',
                               choices = list('\\(H_1\\!\\!:\\,\\bar{x} \\neq \\mu_0\\)' = 'two.sided', 
                                              '\\(H_1\\!\\!:\\,\\bar{x} < \\mu_0\\)' = 'less', 
                                              '\\(H_1\\!\\!:\\,\\bar{x} > \\mu_0\\)' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, uiOutput(ns('t_test1sample'))))
}

comparacionMediasServer_1 <- function(input, output, session, nSeries, compl) {
   values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  
  dataF <- eventReactive(input$doCompare, compl[[input$selectedSeries]]$data()[, 1])
  
  T1 <- eventReactive(input$doCompare, {
    t.test(x = dataF(), alternative = input$hypAlter,  mu = input$valRef, conf.level = input$ConfLev)})
  
  t_test1sample <- eventReactive(input$doCompare, {
    if(T1()$p.value <= (1 - input$ConfLev)) {
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
    }
  })
  
  tableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico t', 'Grados de libertad',
                                  'Valor p', 'Media muestral', 'Error estándar de la media', 'Intervalo de confianza:', 
                                  '~, límite inferior', '~, límite superior', 'Nivel de confianza (%)'), 
               'Valor' = c(T1()$statistic, T1()$parameter, T1()$p.value, 
                           T1()$estimate, T1()$stderr, NA, T1()$conf.int[1], T1()$conf.int[2], (input$ConfLev * 100))))

  output$tableResults <- renderTable(tableResults())
  output$t_test1sample <- renderUI(t_test1sample())
}