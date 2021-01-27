comparacionRanMulUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(12, actionButton(ns('doCompare'), label = "Analizar datos de ANOVA", styleclass = 'primary'), tags$hr()),
           column(12, 
                  box(title = tags$b('Diferencia mínima significativa de Fisher'), width = 4,# height = 900,
                      tags$br(), 
                      tags$h5('La siguiente tabla agrupa los conjuntos de datos que se estudiaron en ANOVA y que no presentan
                              una diferencia estadísticamente significativa entre sí. Las agrupaciones se codifican con letras
                              de manera tal que si la misma letra aparece en con la ilustración de
                              y los grupos en los que dichos'),
                      tableOutput(ns('LSDFTest')), tags$br(), plotOutput(ns('LSDFPlot'))),
                  box(title = tags$b('Diferencias significativas de Tukey'), width = 4,# height = 900,
                      tags$br(), verbatimTextOutput(ns('TukeyTest')), tags$br(), plotOutput(ns('TukeyPlot'))),
                  box(title = tags$b('Rangos múltiples de Duncan'), width = 4,# height = 900, 
                      h5('Esto como se interpreta?'),
                      tags$br(), verbatimTextOutput(ns('DuncanTest')), tags$br(), plotOutput(ns('DuncanPlot')))))
}

comparacionRanMulServer <- function(input, output, session, aovModel) {
  #aovModel <- reactive(aovModel)
  observeEvent(input$doCompare, {
    LSDFReac <- reactive(agricolae::LSD.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    LSDFTest <- reactive(data.frame(Serie = rownames(LSDFReac()$groups), Grupos = LSDFReac()$groups$groups))
    output$LSDFTest <- renderTable(LSDFTest())
    output$LSDFPlot <- renderPlot(plot(LSDFReac(), main = ''))
    
    TukeyReac <- reactive(TukeyHSD(x = aovModel$aovSum(), conf.level = aovModel$aovSig()))
    output$TukeyTest <- renderPrint(TukeyReac())
    output$TukeyPlot <- renderPlot(plot(TukeyReac()))
    
    DuncanReac <- reactive(agricolae::duncan.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    output$DuncanTest <- renderPrint(summary(DuncanReac()))
    output$DuncanPlot <- renderPlot(plot(DuncanReac()))
  })
}
