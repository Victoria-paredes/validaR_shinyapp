comparacionVarianUI_m <- function(id) {
  ns <- NS(id)
  fluidRow(column(2, 
                  uiOutput(ns('selectSeries')),
                  #numericInput(ns('valRef'), label = 'Ingrese valor de referencia', width = '100%', value = 0),
                  sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                              min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                  shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
           column(10, tabBox(title = tags$b('Pruebas múltiples:'), width = 12, height = 600, side = 'right',
                             tabPanel(title = tags$b('Cochran (varianzas anómalas)'), 
                                      uiOutput(ns('outCochranOut')), uiOutput(ns('outCochranIn'))),
                             tabPanel(title = tags$b('Levene'), uiOutput(ns('outLevene1')), uiOutput(ns('outLevene2'))),
                             tabPanel(title = tags$b('Barlett'), uiOutput(ns('outBarlett'))),
                             tabPanel(title = tags$b('Hartley'), uiOutput(ns('outHartley'))))))
                  #box(title = tags$b('Prueba de Barlett'), status = 'primary', width = 6, height = 600, 
                  #        uiOutput(ns('outBarlett'))),
                  #box(title = tags$b('Prueba de Levene'), status = 'primary', width = 6, height = 600, 
                  #    #radioButtons(ns('leveneLocation'), label = 'Localizador central', inline = TRUE,
                  #    #             choices = list('Mediana' = 'median', 'Media' = 'mean')),
                  #    uiOutput(ns('outLevene1')), uiOutput(ns('outLevene2')), 
                  #    h4("Revisar los resultados de esta prueba...")),
                  #box(title = tags$b('Prueba Fmax de Hartley'), status = 'primary', width = 6, height = 450, 
                  #    uiOutput(ns('outHartley'))),
                  #box(title = tags$b('Varianzas anómalas: Prueba de Cochran'), status = 'primary', width = 6, height = 450, 
                  #    #radioButtons(ns('coch.Inly'), label = 'Valor sospechoso', inline = TRUE,
                  #    #             choices = list('Varianza más grande' = FALSE, 'Varianza más pequeña' = TRUE)),
                  #    uiOutput(ns('outCochranOut')), uiOutput(ns('outCochranIn')))))
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
  observe(for (i in input$selectedSeries) {complClean[[i]] <- compl[[i]]$data()[, 1]})
  
  Data   <- eventReactive(input$doCompare, {isolate(reactiveValuesToList(complClean))})
  StData <- reactive(stack(Data()))
  
  #BARLETT
  Brltt <- eventReactive(input$doCompare, {bartlett.test(x = Data())})
  outBarlett <- eventReactive(input$doCompare, {
    if(Brltt()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba de Barlett'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('Al menos dos de las varianzas muestrales presentan entre sí una diferencia estadísticamente significativas,
                          según lo hallado por la prueba de Bartlett, a un nivel de confianza
                         del ', round(100 * input$ConfLev, 1), '%.'),
                 tags$br(), tableOutput(session$ns("BrltttableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('Según la prueba de homogeneidad de varianzas de Barlett, no hay evidencia suficiente para afirmar que las
                         muestras estadísticas sean heterocedásticas, a un nivel de confianza
                         del ', round(100 * input$ConfLev, 1), '%.'), 
                 tags$br(), tableOutput(session$ns("BrltttableResults"))))
    }
  })
  BrltttableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico K^2', 'Grados de libertad', 'Valor p', 'Nivel de confianza (%)'), 
               'Valor' = c(Brltt()$statistic, Brltt()$parameter, Brltt()$p.value, (input$ConfLev * 100))))
  output$BrltttableResults <- renderTable(BrltttableResults())
  output$outBarlett <- renderUI(outBarlett())
  
  #LEVENE1
  LVN1 <- eventReactive(input$doCompare, {
    car::leveneTest(data = StData(), y = values ~ ind, center = 'mean')})
  outLevene1 <- eventReactive(input$doCompare, {
    if(LVN1()$Pr[1] <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("LVN1tableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("LVN1tableResults"))))
    }
  })
  LVN1tableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico F', 'Grados de libertad', '~, numerador', '~, denominador',
                                  'Valor p', 'Nivel de confianza (%)'), 
               'Valor' = c(LVN1()$F[1], NA, LVN1()$Df[1], LVN1()$Df[2], LVN1()$Pr[1], (input$ConfLev * 100))))
  output$LVN1tableResults <- renderTable(LVN1tableResults())
  output$outLevene1 <- renderUI(outLevene1())
  
  #LEVENE2
  LVN2 <- eventReactive(input$doCompare, {
    car::leveneTest(data = StData(), y = values ~ ind, center = 'median')})
  outLevene2 <- eventReactive(input$doCompare, {
    if(LVN2()$Pr[1] <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("LVN2tableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("LVN2tableResults"))))
    }
  })
  LVN2tableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico F', 'Grados de libertad', '~, numerador', '~, denominador',
                                  'Valor p', 'Nivel de confianza (%)'), 
               'Valor' = c(LVN2()$F[1], NA, LVN2()$Df[1], LVN2()$Df[2], LVN2()$Pr[1], (input$ConfLev * 100))))
  output$LVN2tableResults <- renderTable(LVN2tableResults())
  output$outLevene2 <- renderUI(outLevene2())
  
  #HARTLEY
  HRTLY <- eventReactive(input$doCompare, {
    PMCMRplus::hartleyTest(formula = values ~ ind, data = StData())})
  outHartley <- eventReactive(input$doCompare, {
    if(HRTLY()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("HRTLYtableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("HRTLYtableResults"))))
    }
  })
  HRTLYtableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico Fmáx', 'Grados de libertad', 'Parámetro k', 'Valor p', 'Nivel de confianza (%)'), 
               'Valor' = c(HRTLY()$statistic, HRTLY()$parameter[1], HRTLY()$parameter[2], HRTLY()$p.value, (input$ConfLev * 100))))
  output$HRTLYtableResults <- renderTable(HRTLYtableResults())
  output$outHartley <- renderUI(outHartley())
  
  #COCHRAN outlying
  CCHRNout <- eventReactive(input$doCompare, {
    outliers::cochran.test(data = StData(), object = values ~ ind, inlying = FALSE)})
  outCochranOut <- eventReactive(input$doCompare, {
    if(CCHRNout()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("CCHRNouttableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("CCHRNouttableResults"))))
    }
  })
  CCHRNouttableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico de Cochran', 'Grados de libertad', 'Parámetro k', 'Valor p', 'Nivel de confianza (%)',
                                  'Varianza más grande'), 
               'Valor' = c(CCHRNout()$statistic, CCHRNout()$parameter[1], CCHRNout()$parameter[2], CCHRNout()$p.value, 
                           (input$ConfLev * 100), max(CCHRNout()$estimate))))
  output$CCHRNouttableResults <- renderTable(CCHRNouttableResults())
  output$outCochranOut <- renderUI(outCochranOut())
  
  #COCHRAN inlying
  CCHRNin <- eventReactive(input$doCompare, {
    outliers::cochran.test(data = StData(), object = values ~ ind, inlying = TRUE)})
  outCochranIn <- eventReactive(input$doCompare, {
    if(CCHRNin()$p.value <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("CCHRNintableResults"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 6, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("CCHRNintableResults"))))
    }
  })
  CCHRNintableResults <- reactive(
    data.frame('Datos prueba' = c('Estadístico de Cochran', 'Grados de libertad', 'Parámetro k', 'Valor p', 'Nivel de confianza (%)',
                                  'Varianza más pequeña'), 
               'Valor' = c(CCHRNin()$statistic, CCHRNin()$parameter[1], CCHRNin()$parameter[2], CCHRNin()$p.value, 
                           (input$ConfLev * 100), min(CCHRNin()$estimate))))
  output$CCHRNintableResults <- renderTable(CCHRNintableResults())
  output$outCochranIn <- renderUI(outCochranIn())
  
  #observeEvent(input$doCompare, {
  #  output$outBarlett <- renderPrint(bartlett.test(x = isolate(reactiveValuesToList(complClean))))
  #  output$outLevene <- renderPrint(car::leveneTest(data = stack(isolate(reactiveValuesToList(complClean))),
  #                                                  y = values ~ ind, center = input$leveneLocation))
  #  output$outHartley <- renderPrint(PMCMRplus::hartleyTest(formula = values ~ ind, 
  #                                                          data = stack(isolate(reactiveValuesToList(complClean)))))
  #  output$outCochran <- renderPrint(outliers::cochran.test(data = stack(isolate(reactiveValuesToList(complClean))),
  #                                                          object = values ~ ind, inlying = input$coch.Inly))
  #})
}
