regresionUI <- function(id) {
  ns <- NS(id)
  box(title = '', width = 12, status = 'primary', height = 800, 
      fluidRow(
        box(title = '', width = 3, uiOutput(ns('selectSeries')),
            selectInput(ns('model'), label = 'Modelo de regresión:', 
                        choices = list('Mínimos cuadrados ordinarios (OLS)' = 1, 'Mínimos cuadrados ponderados (WLS)' = 2,
                                       'Mínimos cuadrados ortogonales (ODR)' = 3, 'Mínimos cuadrados generalizados (GLS)' = 4,
                                       'Regresión no paramétrica (Passing-Bablock)' = 5)),
            selectizeInput(ns('valX'), label = "Seleccione la variable independiente", width = '80%',
                           choices = list('var.x1' = 1, 'var.x2' = 2, 'var.x3' = 3, 'var.x4' = 4)),
            uiOutput(ns('valY')),
            uiOutput(ns('uX')), 
            uiOutput(ns('uY')),
            
            sliderInput(ns('signif'), label = 'Significancia de los intervalos de confianza', 
                        min = 0.9, max = 0.999, value = 0.95, step = 0.001),
            actionButton(ns("calcularReg"), label = "Hacer regresión", styleclass = 'primary'),
            verbatimTextOutput(ns('testtest'))
            ),
        
        #conditionalPanel(condition = "input.calModel == 'calUnES'", ns = ns,
        tabBox(title = "Gráficos", width = 5,
               tabPanel("Diagrama de  calibración", plotOutput(ns('ExCalCurvPlot')),
                        downloadButton(ns('DwnECCP'), label = 'Descargar gráfico')),
               tabPanel("Grafico de residuales", plotOutput(ns('ExCalResiPlot')),
                        downloadButton(ns('DwnECRP'), label = 'Descargar gráfico'))),#),
        #conditionalPanel(condition = "input.calModel == 'calUnES'", ns = ns,
        column(4, infoBox(width = 12, "Función de calibración", htmlOutput(ns('niceCurvEq')), 
                          color = 'light-blue', icon = icon("vials")),
               infoBox(width = 12, "Función de interpolación", htmlOutput(ns('niceInterpEq')), 
                       color = 'light-blue', icon = icon("vials")),
               infoBox(width = 12, "Significancia estadística", htmlOutput(ns('niceStatSg')),
                       color = 'light-blue', icon = icon("chart-line")),
               infoBox(width = 12, "Analisis de varianza de la regresión", htmlOutput(ns('niceANOVAReg')),
                       color = 'light-blue', icon = icon("chart-line")))#)
      )
      )
}

regresionServer <- function(input, output, session, nSeries, compl) {
  values <- paste0('Serie', 1:20)
  names(values) <- paste('Serie #', 1:20)
  output$selectSeries <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))

  ChcsVars <- 1:4
  names(ChcsVars) <- paste('var.x', ChcsVars)
  
  output$valY <- renderUI({
    selectizeInput(session$ns("valY"), label = "Seleccione la variable dependiente", width = '80%', 
                   choices = ChcsVars[-as.numeric(input$valX)])})
  output$uX <- renderUI({
    if(input$model %in% c(2, 4)) {
      selectizeInput(session$ns("uX"), label = "Seleccione el error en la variable independiente", width = '80%', 
                     choices = ChcsVars[-as.numeric(c(input$valX, input$valY))])}}
  )
  output$uY <- renderUI({
    if(input$model %in% 4) {
      selectizeInput(session$ns("uY"), label = "Seleccione el error en la variable dependiente", width = '80%', 
                     choices = ChcsVars[-as.numeric(c(input$valX, input$valY, input$uX))])}}
  )
  
  x <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$valX)])
  y <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$valY)])
  se.x <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$uX)])
  se.y <- eventReactive(input$calcularReg, compl[[input$selectedSeries]]$data()[, as.numeric(input$uY)])
  
  ExCalCurvXlimYlim <- eventReactive(input$calcularReg, {
    ifelse(all(x() == 0), return(c(0, 1, 0, 1)), return(c(range(x()), range(y()))))
  })
  
  output$testtest <- renderPrint(summary(cCurveESU()))
  
  cCurveESU <- eventReactive(input$calcularReg, {
    if (input$model == 1) return(lm(y() ~ x()))
    if (input$model == 2) return(lm(y() ~ x(), weights = 1 / se.x()^2))
    if (input$model == 3) return(deming::deming(y() ~ x()))
    if (input$model == 4) return(deming::deming(y() ~ x(), xstd = se.x, ystd = se.y))
    if (input$model == 5) return(deming::pbreg(y() ~ x()))
    })
  
  reactive_RSC <- eventReactive(input$calcularReg, {
    list(Eq = ifelse(as.numeric(input$order) == 1,
                     paste0("Signal = (",
                            signif(summary(cCurveESU())$coefficients[1, 1], 4), "\u00b1",
                            signif(summary(cCurveESU())$coefficients[1, 2], 2), ") +<br />
                            &emsp;&emsp;&emsp;&ensp;&ensp;&ensp;(",
                            signif(summary(cCurveESU())$coefficients[2, 1], 4), "\u00b1",
                            signif(summary(cCurveESU())$coefficients[2, 2], 2), ") * Conc"),
                     paste0("Signal = (",
                            signif(summary(cCurveESU())$coefficients[1, 1], 4), "\u00b1",
                            signif(summary(cCurveESU())$coefficients[1, 2], 2), ") +<br />
                            &emsp;&emsp;&emsp;&ensp;&ensp;&ensp;(",
                            signif(summary(cCurveESU())$coefficients[2, 1], 4), "\u00b1",
                            signif(summary(cCurveESU())$coefficients[2, 2], 2), ") * Conc +<br />
                            &emsp;&emsp;&emsp;&ensp;&ensp;&ensp;(",
                            signif(summary(cCurveESU())$coefficients[3, 1], 4), "\u00b1",
                            signif(summary(cCurveESU())$coefficients[3, 2], 2), ") * Conc<sup>2</sup>")),
         St = ifelse(as.numeric(input$order) == 1,
                     paste0("<small>p-values for regression coefficients:</small> <br />&emsp;(Intercept): ",
                            round(summary(cCurveESU())$coefficients[1, 4], 5),
                            "<br />&emsp;Conc:&emsp;&emsp;&ensp;&nbsp;&nbsp;",
                            round(summary(cCurveESU())$coefficients[2, 4], 5),
                            "<hr><small>Residual standard error: ", signif(summary(cCurveESU())$sigma, 4),
                            " on ", summary(cCurveESU())$df[2], " DF",
                            "<br />F-statistic: ", signif(summary(cCurveESU())$fstatistic[1], 4),
                            " on ", summary(cCurveESU())$fstatistic[2], " and ",
                            summary(cCurveESU())$fstatistic[3], " DF,  p-value: ",
                            round(1 - pf(summary(cCurveESU())$fstatistic[1],
                                         summary(cCurveESU())$fstatistic[2],
                                         summary(cCurveESU())$fstatistic[3]), 5), "</small>"),
                     paste0("<small>p-values for regression coefficients:</small> <br />&emsp;(Intercept): ",
                            round(summary(cCurveESU())$coefficients[1, 4], 5),
                            "<br />&emsp;Conc:&emsp;&emsp;&ensp;&nbsp;&nbsp;",
                            round(summary(cCurveESU())$coefficients[2, 4], 5),
                            "<br />&emsp;Conc<sup>2</sup>:&emsp;&emsp;&nbsp;&nbsp;",
                            round(summary(cCurveESU())$coefficients[3, 4], 5),
                            "<hr><small>Residual standard error: ", signif(summary(cCurveESU())$sigma, 4),
                            " on ", summary(cCurveESU())$df[2], " DF",
                            "<br />F-statistic: ", signif(summary(cCurveESU())$fstatistic[1], 4),
                            " on ", summary(cCurveESU())$fstatistic[2], " and ",
                            summary(cCurveESU())$fstatistic[3], " DF,  p-value: ",
                            round(1 - pf(summary(cCurveESU())$fstatistic[1],
                                         summary(cCurveESU())$fstatistic[2],
                                         summary(cCurveESU())$fstatistic[3]), 5), "</small>")),
         plt = ggplot(data = ExCalCurvMyChanges(), aes(x = Conc, y = Signal)) +
           theme_bw() + geom_point(size = 3, shape = 16)  +
           labs(y = 'Signal', x = expression(paste('Concentration'))) +# (mg k', g^{-1}, ')'))) +
           theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 axis.text.x = element_text(color = "black"),
                 axis.text.y = element_text(color = "black")) +
           scale_y_continuous(limits = ExCalCurvXlimYlim()[3:4] + diff(ExCalCurvXlimYlim()[3:4]) * c(-2, 2)) +
           scale_x_continuous(limits = ExCalCurvXlimYlim()[1:2] + diff(ExCalCurvXlimYlim()[1:2]) * c(-2, 2)) +
           coord_cartesian(xlim = ExCalCurvXlimYlim()[1:2], ylim = ExCalCurvXlimYlim()[3:4]) +
           geom_smooth(method = 'lm', formula = y ~ poly(x, orderRSC()),
                       fullrange = TRUE, color = 'black', size = 0.4, level = Signif()),
         rsd = ggplot(data = data.frame(Residuals = cCurveESU()$residuals, Concentration = ExCalCurvMyChanges()$Conc),
                      aes(x = Concentration, y = Residuals)) + theme_bw() + geom_point() +
           theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 axis.text.x = element_text(color = "black"),
                 axis.text.y = element_text(color = "black")) +
           scale_x_continuous(limits = ExCalCurvXlimYlim()[1:2] + diff(ExCalCurvXlimYlim()[1:2]) * c(-2, 2)) +
           coord_cartesian(xlim = ExCalCurvXlimYlim()[1:2]) +
           geom_smooth(method = 'lm', color = 'black', fullrange = TRUE))
  })
  
  
    
#    cCurveESU <- eventReactive(input$calculateRSC, {
#      if(input$model == 1) {calibCurve(curve = ExCalCurvMyChanges(), order = as.numeric(input$order), plot = FALSE)}})
    
#  })
}