regresionUI <- function(id) {
  ns <- NS(id)
  #box(title = '', width = 12, status = 'primary', height = 800, 
      fluidRow(
        column(12, box(title = '', width = 3, uiOutput(ns('selectSeries')),
               selectInput(ns('model'), label = 'Modelo de regresión:', 
                           choices = list('Mínimos cuadrados ordinarios (OLS)' = 1, 'Mínimos cuadrados ponderados (WLS)' = 2,
                                          'Mínimos cuadrados ortogonales (ODR)' = 3, 'Mínimos cuadrados generalizados (GLS)' = 4,
                                          'Regresión no paramétrica (Passing-Bablock):' = 5)),
               selectizeInput(ns('valX'), label = "Variable independiente", width = '80%',
                              choices = list('col.X1' = 1, 'col.X2' = 2, 'col.X3' = 3, 'col.X4' = 4)),
               uiOutput(ns('valY')),
               conditionalPanel(condition = "input.model == '3'", ns = ns,
                                checkboxInput(ns('ponderados'), label = 'Regresión ponderada', value = FALSE),
                                uiOutput(ns('sePond'))),
               uiOutput(ns('uX')), 
               uiOutput(ns('uY')),
                
               sliderInput(ns('signif'), label = 'Significancia de los intervalos de confianza', 
                           min = 0.9, max = 0.999, value = 0.95, step = 0.001),
               actionButton(ns("calcularReg"), label = "Calcular regresión", styleclass = 'primary'),
               verbatimTextOutput(ns('testtest'))),
            
            tabBox(title = tags$b("Gráficos:"), width = 5, side = 'right',
                   tabPanel("Diagrama de  calibración", 
                            dropdownButton(circle = TRUE, status = "danger", icon = icon("gear"), width = "300px", size = 'sm',
                                           tooltip = tooltipOptions(title = "Etiquetas de eje"),
                                           textInput(ns('xlab'), label = 'Etiqueta eje X', value = 'Variable independiente'),
                                           textInput(ns('ylab'), label = 'Etiqueta eje Y', value = 'Variable dependiente'),
                                           tags$h4('Se debe recalcular la regresión para que el cambio se haga efectivo.')),
                            plotOutput(ns('nicePltMain')),
                            downloadButton(ns('DwnECCP'), label = 'Descargar gráfico')),
                   tabPanel("Grafico de residuales", plotOutput(ns('nicePltResiduals')),
                            downloadButton(ns('DwnECRP'), label = 'Descargar gráfico'))),
        
               infoBox(width = 4, "Función de calibración", htmlOutput(ns('niceCurvEq')), 
                       color = 'light-blue', icon = icon("vials")),
               infoBox(width = 4, "Función de interpolación", htmlOutput(ns('niceInterpEq')), 
                       color = 'light-blue', icon = icon("vials")),
               infoBox(width = 4, "Significancia estadística", htmlOutput(ns('niceStatSg')),
                       color = 'light-blue', icon = icon("chart-line")),
               infoBox(width = 4, "Analisis de varianza de la regresión", htmlOutput(ns('niceANOVAReg')),
                       color = 'light-blue', icon = icon("chart-line")))#)
     # )
     )
}

regresionServer <- function(input, output, session, nSeries, compl, configDwn) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))

  ChcsVars <- 1:4
  names(ChcsVars) <- paste('col.X', ChcsVars)
  
  output$valY <- renderUI({
    selectizeInput(session$ns("valY"), label = "Variable dependiente", width = '80%', 
                   choices = ChcsVars[- as.numeric(input$valX)])})
  output$sePond <- renderUI({
#    if(input$model %in% c(3, 5)) {
      if(input$ponderados) {
        selectizeInput(session$ns("sePond"), label = "Error de los puntos experimentales", width = '80%', 
                       choices = ChcsVars[-as.numeric(c(input$valX, input$valY))])}}#}
    )
  output$uX <- renderUI({
    if(input$model %in% c(2, 4)) {
      selectizeInput(session$ns("uX"), label = "Error en la variable independiente", width = '80%', 
                     choices = ChcsVars[-as.numeric(c(input$valX, input$valY))])}}
  )
  output$uY <- renderUI({
    if(input$model %in% 4) {
      selectizeInput(session$ns("uY"), label = "Error en la variable dependiente", width = '80%', 
                     choices = ChcsVars[-as.numeric(c(input$valX, input$valY, input$uX))])}}
  )
  
  x <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$valX)])
  y <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$valY)])
  se.x <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$uX)])
  se.y <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$uY)])
  sePond <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$sePond)])  
  InputSignif <- reactive(as.numeric(input$signif))
  ExCalCurvXlimYlim <- eventReactive(input$calcularReg, {
    ifelse(all(x() == 0), return(c(0, 1, 0, 1)), return(c(range(x()), range(y()))))
  })
  
  
  #Calculate Models
  cCurveESU <- eventReactive(input$calcularReg, {
    if (input$model == 1) return(lm(y() ~ x()))
    if (input$model == 2) return(lm(y() ~ x(), weights = 1 / se.x()^2))
    if (input$model == 3) ifelse(input$ponderados, return(deming::deming(y() ~ x(), weights = 1 / sePond()^2)),
                                 return(deming::deming(y() ~ x())))
    if (input$model == 4) return(deming::deming(y() ~ x(), xstd = se.x(), ystd = se.y()))
    if (input$model == 5) deming::pbreg(y() ~ x())
    })
  
  #Show regression equation
  mssgNcCrvEq <- c("Curva de regresión por mínimos cuadrados ordinarios:",
                   "Curva de regresión por mínimos cuadrados ponderados:",
                   "Curva de regresión por mínimos cuadrados ortogonales",
                   "Curva de regresión por mínimos cuadrados generalizados:",
                   "Curva de regresión por método no paramétrico de Passing-Bablock:")
  niceCurvEq <- eventReactive(input$calcularReg, {
    if (input$model %in% 1:2) return(paste0(mssgNcCrvEq[as.numeric(input$model)], "<br /> Y = (",
                                        signif(summary(cCurveESU())$coefficients[1, 1], 4), "\u00b1",
                                        signif(summary(cCurveESU())$coefficients[1, 2], 2), ") + (",
                                        #<br />&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;(",
                                        signif(summary(cCurveESU())$coefficients[2, 1], 4), "\u00b1",
                                        signif(summary(cCurveESU())$coefficients[2, 2], 2), ") * X"))
    if (input$model %in% 3:4) return(paste0(mssgNcCrvEq[as.numeric(input$model)],
                                            ifelse(input$ponderados, " ponderados:", ":"), "<br /> Y = (",
                                            signif(cCurveESU()$coefficients[1], 4), "\u00b1",
                                            signif(cCurveESU()$se[1], 2), ") + (",
                                            signif(cCurveESU()$coefficients[2], 4), "\u00b1",
                                            signif(cCurveESU()$se[2], 2), ") * X"))
    if (input$model == 5) return(paste0(mssgNcCrvEq[as.numeric(input$model)], "<br /> Y = ",
                                        signif(cCurveESU()$coefficients[1], 4), ' + ',
                                        signif(cCurveESU()$coefficients[2], 4), ' * X'))
  })
  
  
  niceInterpEq <- eventReactive(input$calcularReg, { })
  niceStatSg <- eventReactive(input$calcularReg, { })
  
  nicePltMain <-  eventReactive(input$calcularReg, {
    p <- ggplot(data = data.frame(x = x(), y = y()), aes(x = x, y = y)) +
           theme_bw() + geom_point(size = 3, shape = 16) +
           labs(y = input$ylab, x = input$xlab) +# (mg k', g^{-1}, ')'))) +
           theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 axis.text.x = element_text(color = "black"),
                 axis.text.y = element_text(color = "black")) +
           scale_y_continuous(limits = ExCalCurvXlimYlim()[3:4] + diff(ExCalCurvXlimYlim()[3:4]) * c(-2, 2)) +
           scale_x_continuous(limits = ExCalCurvXlimYlim()[1:2] + diff(ExCalCurvXlimYlim()[1:2]) * c(-2, 2)) +
           coord_cartesian(xlim = ExCalCurvXlimYlim()[1:2], ylim = ExCalCurvXlimYlim()[3:4])
    
    if (input$model == 1) p <- p + geom_smooth(method = 'lm', formula = y ~ x, fullrange = TRUE, color = 'black', 
                                               size = 0.4, level = InputSignif())
    if (input$model == 2) p <- p + geom_smooth(data = data.frame(x = x(), y = y(), w = se.x()), method = 'lm', formula = y ~ x, 
                                               fullrange = TRUE, color = 'black', size = 0.4, level = InputSignif(),
                                               mapping = aes(weight = w))
    if (input$model == 3) p <- p + geom_smooth(method = demingJANGLX, formula = y ~ x, fullrange = TRUE, color = 'black', 
                                               size = 0.4, level = InputSignif())
    if (input$model %in% 4:5) p <- p + geom_abline(intercept = cCurveESU()$coefficients[1], slope = cCurveESU()$coefficients[2],
                                                   color = 'black', size = 0.4)
    
    return(p)
  })
  
  nicePltResiduals <-  eventReactive(input$calcularReg, {
    p <- ggplot(data = data.frame(Residuales = cCurveESU()$residuals, x = x()),
                aes(x = x, y = Residuales)) + theme_bw() + geom_point() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            axis.text.x = element_text(color = "black"),
            axis.text.y = element_text(color = "black")) +
      scale_x_continuous(limits = ExCalCurvXlimYlim()[1:2] + diff(ExCalCurvXlimYlim()[1:2]) * c(-2, 2)) +
      coord_cartesian(xlim = ExCalCurvXlimYlim()[1:2]) +
      geom_smooth(method = 'lm', color = 'black', fullrange = TRUE)

    return(p)
  })
  
  output$testtest <- renderPrint(summary(cCurveESU()))
  
  output$niceCurvEq   <- renderText(niceCurvEq())
  output$niceStatSg   <- renderText(niceStatSg())
  output$niceInterpEq <- renderText(niceInterpEq())
  
  output$nicePltMain      <- renderPlot(nicePltMain())
  output$nicePltResiduals <- renderPlot(nicePltResiduals())

  return(reactive(cCurveESU()))
}