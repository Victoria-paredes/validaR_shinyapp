precisionHorRatUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(4, fluidRow(column(4, numericInput(ns('Conc.HorRatEval'), label = 'Concentración:', value = 0.001)),
                              column(8, selectInput(ns('Unts.HorRatEval'), label = 'Unidades: (pendiente)', 
                                                    choices = list("Fracción másica (adimensional)" = 1, 
                                                                   "g/kg (o equivalente)" = 1e-3,
                                                                   "mg/kg (o equivalente)" = 1e-6,
                                                                   "ug/kg (o equivalente)" = 1e-9, 
                                                                   "ng/kg (o equivalente)" = 1e-12)))), 
                  #Pendiente: https://stackoverflow.com/questions/34902765/vector-input-in-shiny-r-and-then-use-it
                  tags$hr(),
                  textOutput(ns('HorRatRsl1')),
                  textOutput(ns('HorRatRsl2')),
                  textOutput(ns('HorRatRsl3')),
                  textOutput(ns('HorRatRsl4'))),
           column(8, sliderInput(inputId = ns("Range.HorRat"), label = "Rango (fracción másica) para el gráfico de la trompeta de Horwitz
                                 (Logarítmo base 10 (ARREGLAR FORMATO!!!))", min = -12, 
                                  max = 0, value = c(-5, -2), width = '50%'),
                  plotOutput(outputId = ns("HorRatPlt"))
                  ))
}

precisionHorRatServer <- function(input, output, session) {
  HorRatFun <- function (x) 2 ^(1 - 0.5 * log10(x))
  HorRatVal <- reactive(HorRatFun(input$Conc.HorRatEval*as.numeric(input$Unts.HorRatEval)))
  HorRatLims <- reactive(10 ^ input$Range.HorRat)
  output$HorRatRsl1 <- reactive({paste0("Coeficiente de variación de Horwitz: ", round(HorRatVal(), 2), " %")})
  output$HorRatRsl2 <- reactive({paste0("Límite para repetibilidad: ", round(HorRatVal() * 0.5, 2), " %")})
  output$HorRatRsl3 <- reactive({paste0("Límite para precisión intermedia: ", round(HorRatVal() * 2 / 3, 2), " %")})
  output$HorRatRsl4 <- reactive({paste0("Límite para reproducibilidad: ", round(HorRatVal(), 2), " %")})
  output$HorRatPlt <- renderPlot({
    ggplot(data = data.frame(Conc = rep(seq(HorRatLims()[1], HorRatLims()[2], length.out = 100), 3),
                             HorRat = c(HorRatFun(seq(HorRatLims()[1], HorRatLims()[2], length.out = 100)),
                                        0.5 * HorRatFun(seq(HorRatLims()[1], HorRatLims()[2], length.out = 100)),
                                        (2/3) * HorRatFun(seq(HorRatLims()[1], HorRatLims()[2], length.out = 100))),
                             group = rep(c('Reproducibilidad', 'Repetibilidad', 'Precisión intermedia'), each = 100))) + 
      geom_line(aes(x = Conc, y = HorRat, group = group, color = group)) +
      labs(x = 'Fracción másica', y = 'RSD máxima') + theme_bw() + 
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
              axis.text.x = element_text(color = "black"),
              axis.text.y = element_text(color = "black"))
  })
}




