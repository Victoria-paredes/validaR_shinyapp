comparacionANOVAUI <- function(id) {
  ns <- NS(id)
  column(12, box(title = tags$b('Análisis de varianza'), width = 12, status = 'primary',
                fluidRow(column(2, uiOutput(ns('selectSeries')),
                                sliderInput(ns('ConfLev'), label = 'Nivel de confianza:', 
                                            min = 0.9, max = 0.999, value = 0.95, step = 0.001),
                                shiny::actionButton(ns('doCompare'), label = "Correr análisis", styleclass = 'primary', block = TRUE)),
                         column(5, verbatimTextOutput(ns('anova1'))),
                         column(5, 
                                tabBox(title = tags$b("Diagramas"), width = 12,
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
                                                downloadButton(ns('DwnResidPlt'), label = 'Descargar gráfico')))))))
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
  data <-  eventReactive(input$doCompare, {stack(isolate(reactiveValuesToList(complClean)))})
  anovaReac <- reactive(aov(formula = values ~ ind, data = data()))
  BoxWPlt <- reactive(boxplot(formula = values ~ ind, data = data(), xlab = input$xBoxW, ylab = input$yBoxW))
  ResidPlt <- reactive({
    Model <- data.frame(Fitted = fitted(anovaReac()), Residuals = resid(anovaReac()), Treatment = data()$ind)
    p <- ggplot(Model, aes(Fitted, Residuals, colour = Treatment)) + geom_point() + theme_bw() +
             labs(y = input$ylabQQ, x = input$xlabQQ) + geom_smooth(method = 'loess', formula = 'y ~ x', col = 'blue') +
             theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                   axis.text.x = element_text(color = "black"), axis.text.y = element_text(color = "black"))
    if(input$LegResid) {
      p <- p + labs(color = input$LegTxResid)
    } else {
      p <- p + theme(legend.position = 'none')
    }
    return(p)})
  
  output$anova1      <- renderPrint(summary(anovaReac()))
  output$BoxWPlt     <- renderPlot(BoxWPlt())
  output$ResidPlt    <- renderPlot(ResidPlt())
  output$DwnBoxWPlt  <- dwldhndlr(name = 'CajasBigotes', formatP = formatP, dimensP = dimensP, plt = BoxWPlt())
  output$DwnResidPlt <- dwldhndlr(name = 'residualesANOVA', formatP = formatP, dimensP = dimensP, plt = ResidPlt())
  
  return(list('aovSum' = anovaReac, 'aovSig' = reactive(input$ConfLev)))
}