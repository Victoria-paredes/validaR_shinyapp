regresionUI <- function(id) {
  ns <- NS(id)
  box(title = '', width = 12, status = 'primary', height = 500, 
      fluidRow(
        box(title = '', width = 3, uiOutput(ns('selectSeries')),uiOutput(ns('selectSeries1')),
            selectInput(ns('model'), label = 'Modelo de regresión:', 
                        choices = list('Mínimos cuadrados ordinarios (OLS)' = 1, 'Mínimos cuadrados ponderados (WLS)' = 2,
                                       'Mínimos cuadrados ortogonales (ODR)' = 3, 'Mínimos cuadrados generalizados (GLS)' = 4)),
            selectInput(ns('valX'), label = "Seleccione la variable independiente", width = '80%',
                           choices = list('var.x1' = 1, 'var.x1' = 2, 'var.x3' = 3, 'var.x4' = 4)),
            uiOutput(ns('uX')), uiOutput(ns('valY')), uiOutput(ns('u_Y')),
            
            radioButtons(ns("signif"), label = 'Significancia de los intervalos de confianza',
                         choices = list('0.99' = 0.99, '0.95' = 0.95)),
            actionButton(ns("calcularReg"), label = "Hacer regresión", styleclass = 'primary')
            ),
        
        #conditionalPanel(condition = "input.calModel == 'calUnES'", ns = ns,
        tabBox(title = "Plots", width = 5,
               tabPanel("Calibration", plotOutput(ns('ExCalCurvPlot')),
                        downloadButton(ns('DwnECCP'), label = 'Descargar gráfico')),
               tabPanel("Residuals", plotOutput(ns('ExCalResiPlot')),
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
  output$selectSeries1 <- renderUI(selectInput(session$ns("selectedSeries"), label = 'Seleccione un conjunto de datos',
                                              #choices = list('Series 1' = 1, 'Series 2' = 2)))
                                              choices = values[1:nSeries()]))

  ChcsVars <- 1:4
  names(ChcsVars) <- paste('var.x', 1:4)
  output$uX <- renderUI(selectInput(session$ns("uX"), label = "Seleccione la variable independiente", width = '80%', choices = ChcsVars))
  
  
  
#  observeEvent(input$doCompare, {
#    output$t_test1sample <- renderPrint(t.test(x = compl[[input$selectedSeries]]$data()[, 1],
#                                               alternative = input$hypAlter, 
#                                               mu = input$valRef,
#                                               conf.level = input$signif))
#  })
}