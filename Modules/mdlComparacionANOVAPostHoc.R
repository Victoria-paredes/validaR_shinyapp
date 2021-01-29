comparacionRanMulUI <- function(id) {
  ns <- NS(id)
  fluidRow(column(12, shiny::actionButton(ns('doCompare'), label = "Analizar datos de ANOVA", styleclass = 'primary'), tags$hr()),
           column(12, 
                  box(title = tags$b('Diferencia mínima significativa de Fisher'), width = 4,# height = 900,
                      tags$h5('La tabla a continuación muestra las series de datos agrupadas con las demás series de datos con las que
                              no presentan
                              una diferencia estadísticamente significativa según la prueba LSD de Fisher. 
                              Las agrupaciones se codifican con letras
                              de manera tal que si la misma letra aparece frente a dos conjuntos de datos, la diferencia 
                              entre las medias de tales series no se considera estadísticamente significativa'),
                      tableOutput(ns('LSDFTest')),
                      tags$h5('El siguiente gráfico complementa la información de la tabla y es similar al diagrama de cajas y bigotes,
                              incluyendo la información de los grupos de series similares entre sí.'), 
                      plotOutput(ns('LSDFPlot')), downloadButton(ns('DwnLSDFPlot'), label = 'Descargar gráfico')),
                  box(title = tags$b('Diferencias significativas de Tukey'), width = 4,
                      tags$h5('A continuación se muestran los valores p de la diferencia entre parejas de muestras estadísticas, 
                              según la prueba de diferencias honestas significativas de Tukey. Aquellas diferencias cuyo valor p es menor 
                              a la significancia (1 - nivel de confianza), se consideran estadísticament significativas.'), 
                      tableOutput(ns('TukeyTest')),
                      tags$h5('El siguiente gráfico ilustra los intervalos de confianza para las diferencias entre las parejas.'),
                      plotOutput(ns('TukeyPlot')), downloadButton(ns('DwnTukeyPlot'), label = 'Descargar gráfico')),
                  box(title = tags$b('Rangos múltiples de Duncan'), width = 4,# height = 900, 
                      tags$h5('La tabla a continuación muestra las series de datos agrupadas con las demás series de datos con las que
                              no presentan
                              una diferencia estadísticamente significativa según la prueba HSD de Duncan 
                              Las agrupaciones se codifican de la misma manera que se describió en la prueba LSD de Fisher.'),
                      tableOutput(ns('DuncanTest'))#, tags$br(), 
                      #plotOutput(ns('DuncanPlot')), downloadButton(ns('DwnDuncanPlot'), label = 'Descargar gráfico')
                      )))
}

comparacionRanMulServer <- function(input, output, session, aovModel, formatP, dimensP) {
  #aovModel <- reactive(aovModel)
  observeEvent(input$doCompare, {
    LSDFReac <- reactive(agricolae::LSD.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    LSDFTest <- reactive(data.frame(Serie = rownames(LSDFReac()$groups), Grupos = LSDFReac()$groups$groups))
    output$LSDFTest <- renderTable(LSDFTest())
    LSDFPlot <- reactive({plot(LSDFReac(), main = '')})
    output$LSDFPlot     <- renderPlot(LSDFPlot())
    
    TukeyReac <- reactive(TukeyHSD(x = aovModel$aovSum(), conf.level = aovModel$aovSig()))
    TukeyTest <- reactive(data.frame('Parejas' = rownames(TukeyReac()$ind), 'Valor p' = TukeyReac()$ind[, 4]))
    output$TukeyTest <- renderTable(TukeyTest())
    TukeyPlot <- reactive(plot(TukeyReac()))
    output$TukeyPlot <- renderPlot(TukeyPlot())
    
    DuncanReac <- reactive(agricolae::duncan.test(y = aovModel$aovSum(), trt = 'ind', alpha = (1 - aovModel$aovSig())))
    DuncanTest <- reactive(data.frame(Serie = rownames(LSDFReac()$groups), Grupos = LSDFReac()$groups$groups))
    output$DuncanTest <- renderTable(DuncanTest())
    #output$DuncanPlot <- renderPlot(plot(DuncanReac()))

    output$DwnLSDFPlot  <- dwldhndlr(name = 'LSD_PostHocANOVA', formatP = formatP, dimensP = dimensP, plt = LSDFPlot())
    output$DwnTukeyPlot  <- dwldhndlr(name = 'HSDTukey_PostHocANOVA', formatP = formatP, dimensP = dimensP, plt = TukeyPlot())
  })
}
