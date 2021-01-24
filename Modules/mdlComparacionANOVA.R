comparacionANOVAUI <- function(id) {
  ns <- NS(id)
  column(12,
    box(title = tags$b('Análisis de varianza'), width = 12, status = 'primary',
        fluidRow(
          column(3, uiOutput(ns('selectSeries')),
                 sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                 shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
          column(9, #tags$h4(tags$b('Supuestos del análisis:')), 
                 uiOutput(ns('aovAss1')), uiOutput(ns('aovAss2')), uiOutput(ns('aovAss3')))),
        tags$hr(), 
        fluidRow(
          column(4, 
                 tabBox(title = tags$b("Diagramas:"), width = 12, side = 'right',
                        tabPanel("Cajas y bigotes", 
                                 dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), 
                                                width = "300px", size = 'sm',
                                                tooltip = tooltipOptions(title = "Configuraciones del gráfico"),
                                                textInput(ns('xBoxW'), label = 'Etiqueta eje X', value = 'Grupo'),
                                                textInput(ns('yBoxW'), label = 'Etiqueta eje Y', value = 'Variable')),
                                 plotOutput(ns('BoxWPlt')),
                                 downloadButton(ns('DwnBoxWPlt'), label = 'Descargar gráfico')),
                        tabPanel("Gráfico de residuales", 
                                 dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), 
                                                width = "300px", size = 'sm',
                                                tooltip = tooltipOptions(title = "Configuraciones del gráfico"),
                                                textInput(ns('xResid'), label = 'Etiqueta eje X', 
                                                          value = 'Valor ajustado'),
                                                textInput(ns('yResid'), label = 'Etiqueta eje Y', 
                                                          value = 'Residuales'),
                                                materialSwitch(ns('LegResid'), label = 'Legenda', 
                                                               value = TRUE, status = "primary"),
                                                textInput(ns('LegTxResid'), label = 'Título de la legenda', 
                                                          value = 'Grupos')
                                 ),
                                 plotOutput(ns('ResidPlt')),
                                 downloadButton(ns('DwnResidPlt'), label = 'Descargar gráfico')))),
        column(8, uiOutput(ns('anova1'))))))
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
  observe(for (i in input$selectedSeries) {complClean[[i]] <- compl[[i]]$data()[, 1]})
  Data   <- eventReactive(input$doCompare, {isolate(reactiveValuesToList(complClean))})
  StData <- reactive(stack(Data()))
  
  anovaReac <- reactive(aov(formula = values ~ ind, data = StData()))
  
  anova1 <- eventReactive(input$doCompare, {
    if(summary(anovaReac())[[1]][["Pr(>F)"]][[1]]  <= (1 - input$ConfLev)) {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'danger',
                 footer = tags$span(style = "color:red", 
                                    'Resultados estadísticamente significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (NO PASA) xxx.'),
                 tags$br(), tableOutput(session$ns("anovaTable"))))
    } else {
      return(box(title = tags$b('Resultado de la prueba'), width = 12, status = 'success',
                 footer = tags$span(style = "color:green", 
                                    'Resultados estadísticamente no significativos al nivel de confianza escogido.'),
                 tags$h4('La muestra estadística (PASA) xxx.'), 
                 tags$br(), tableOutput(session$ns("anovaTable"))))
    }
  })
  
  anovaTable <- reactive(
    data.frame('Fuente de variación' = c('Entre grupos', 'Dentro de los grupos'), 
               'G.L.'  = floor(summary(anovaReac())[[1]][["Df"]]),
               'Suma de cuadrados'  = summary(anovaReac())[[1]][["Sum Sq"]],
               'Cuadrado medio'  = summary(anovaReac())[[1]][["Mean Sq"]],
               'Estadístico F'  = summary(anovaReac())[[1]][["F value"]],
               'Valor p'  = summary(anovaReac())[[1]][["Pr(>F)"]]))
  
  
  BoxWPlt <- reactive({boxplot(formula = values ~ ind, data = StData(), xlab = input$xBoxW, ylab = input$yBoxW)})
  ResidPlt <- reactive({
    Model <- data.frame(Fitted = fitted(anovaReac()), Residuals = resid(anovaReac()), Treatment = StData()$ind)
    p <- ggplot(Model, aes(Fitted, Residuals, colour = Treatment)) + geom_point() + theme_bw() +
      labs(y = input$ylabQQ, x = input$xlabQQ) + geom_smooth(method = 'loess', formula = 'y ~ x', col = 'blue', se = FALSE) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            axis.text.x = element_text(color = "black"), axis.text.y = element_text(color = "black"))
    if(input$LegResid) {
      p <- p + labs(color = input$LegTxResid)
    } else {
      p <- p + theme(legend.position = 'none')
    }
    return(p)})
  
  aovAss1 <- eventReactive(input$doCompare, {
    switchAlert <- FALSE
    for (i in 1:length(Data())) {
      if ((outliers::dixon.test(Data()[[i]]))$p.value <= (1 - input$ConfLev) || 
          (outliers::grubbs.test(Data()[[i]])$p.value <= (1 - input$ConfLev))) {switchAlert <- TRUE; break()}}
    if (switchAlert) {
      return(box(title = tags$b('Supuestos del análisis: Ausencia de anómalos'), width = 12, status = 'danger',
                 h5('Es posible que el supuesto de ausencia de datos anómalos al interior de los grupos no se cumpla.
                    Revise las pruebas de anómalos en la sección', tags$b('Estadística descriptiva.'))))
    } else {
      return(box(title = tags$b('Supuestos del análisis: Ausencia de anómalos'), width = 12, status = 'success',
                 h5('No se encontró evidencia en contra del supuesto de ausencia de datos anómalos al interior de los grupos.')))}})
  
  aovAss2 <- eventReactive(input$doCompare, {
    switchAlert <- FALSE
    for (i in 1:length(Data())) {
      if (shapiro.test(Data()[[i]])$p.value <= (1 - input$ConfLev)) {switchAlert <- TRUE; break()}}
    if (switchAlert) {
      return(box(title = tags$b('Supuestos del análisis: Normalidad de los datos'), width = 12, status = 'danger',
                 h5('Es posible que el supuesto de normalidad no se cumpla para alguno de los grupos. 
                    Revise las pruebas de normalidad en la sección', tags$b('Estadística descriptiva.'))))
    } else {
      return(box(title = tags$b('Supuestos del análisis: Normalidad de los datos'), width = 12, status = 'success',
                 h5('No se encontró evidencia en contra del supuesto de normalidad al interior de los grupos.')))}})
  
  aovAss3 <- eventReactive(input$doCompare, {
    switchAlert <- FALSE  
    
      if ((car::leveneTest(data = StData(), y = values ~ ind))$Pr[1] <= (1 - input$ConfLev) ||
          (car::leveneTest(data = StData(), y = values ~ ind, center = 'median'))$Pr[1] <= (1 - input$ConfLev) ||
          (bartlett.test(x = Data()))$p.value <= (1 - input$ConfLev) ||
          (outliers::cochran.test(data = StData(), object = values ~ ind))$p.value <= (1 - input$ConfLev)) {switchAlert <- TRUE}
    
    if (switchAlert) {
      return(box(title = tags$b('Supuestos del análisis: Homocedasticidad entre series'), width = 12, status = 'danger',
                 h5('Es posible que el supuesto de varianza homogénea no se cumpla entre las series analizadas.
                    Revise las pruebas de comparación de múltiples varianzas en la sección', tags$b('Comparación de varianzas.'))))
    } else {
      return(box(title = tags$b('Supuestos del análisis: Homocedasticidad entre series'), width = 12, status = 'success',
                 h5('No se encontró evidencia en contra del supuesto de homogeneidad de varianzas entre los grupos.')))}})
  
  output$anova1      <- renderUI(anova1())
  output$anovaTable  <- renderTable(anovaTable())
  output$BoxWPlt     <- renderPlot(BoxWPlt())
  output$ResidPlt    <- renderPlot(ResidPlt())
  output$DwnBoxWPlt  <- dwldhndlr(name = 'CajasBigotes', formatP = formatP, dimensP = dimensP, plt = BoxWPlt())
  output$DwnResidPlt <- dwldhndlr(name = 'residualesANOVA', formatP = formatP, dimensP = dimensP, plt = ResidPlt())
  output$aovAss1     <- renderUI(aovAss1())
  output$aovAss2     <- renderUI(aovAss2())
  output$aovAss3     <- renderUI(aovAss3())
  
  return(list('aovSum' = anovaReac, 'aovSig' = reactive(input$ConfLev)))
}