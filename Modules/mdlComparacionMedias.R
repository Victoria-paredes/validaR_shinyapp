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
           column(8, htmlOutput(ns('t_test1sample'))))
}

comparacionMediasUI_2 <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  radioButtons(ns('hypAlter'), label = 'Hipótesis alternativa',
                               choices = list('\\(H_1\\!\\!: \\,\\bar{x}_1 \\neq \\bar{x}_2\\)' = 'two.sided', 
                                              '\\(H_1\\!\\!: \\,\\bar{x}_1 < \\bar{x}_2\\)' = 'less', 
                                              '\\(H_1\\!\\!: \\,\\bar{x}_1 > \\bar{x}_2\\)' = 'greater')), 
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  materialSwitch(ns('paired'), label = 'Muestras emparejadas', value = FALSE, status = "primary"),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(8, htmlOutput(ns('t_test2samples'))))
}




comparacionMediasServer_1 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))
  t_test1sample <- eventReactive(input$doCompare, {
    T1 <- t.test(x = compl[[input$selectedSeries]]$data()[, 1],
                 alternative = input$hypAlter, 
                 mu = input$valRef,
                 conf.level = input$ConfLev)
    T1tx <- ifelse(T1$p.value <= (1 - input$ConfLev),
                   'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                   'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(T1tx, tags$b(pround(T1$p.value, digits = 4)), tags$br(),
                   'Media aritmética muestral:', T1$estimate, tags$br(),
                   'Intervalo de confianza para la media:', T1$conf.int, 'a un', 
                   input$ConfLev * 100, '% de nivel de confianza.'))})
  
  output$t_test1sample <- renderPrint(t_test1sample())
}

comparacionMediasServer_2 <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  
  output$selectSeries <- renderUI(selectizeInput(session$ns("selectedSeries"), label = 'Seleccione 2 conjuntos de datos', 
                                                 options = list(maxItems = 2), 
                                                 #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                                 choices = values[1:nSeries()]))
  t_test2samples <- eventReactive(input$doCompare, {
    T2 <- t.test(x = compl[[input$selectedSeries[1]]]$data()[, 1],
                 y = compl[[input$selectedSeries[2]]]$data()[, 1],
                 alternative = input$hypAlter, 
                 conf.level = input$ConfLev,
                 paired = input$paired)
    T2tx <- ifelse(T2$p.value <= (1 - input$ConfLev),
                   'La muestra estadística (NO PASA) xxx. Valor p de la prueba: ',
                   'La muestra estadística (SÍ PASA) .... Valor p de la prueba:')
    return(tags$h4(T2tx, tags$b(pround(T2$p.value, digits = 4)), tags$br(),
                   'Diferencia de las medias aritméticas muestrales:', T2$estimate, tags$br(),
                   'Intervalo de confianza para la diferencia:', T2$conf.int, 'a un', 
                   input$ConfLev * 100, '% de nivel de confianza.'))})
  
    output$t_test2samples <- renderPrint(t_test2samples())
}