library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2) #Grammar of graphics
library(shinysky)
library(rhandsontable)
library(purrr) #map-like functional programing

#library(ggvis) #ggvis: Interactive Grammar of Graphics - input_slider: Create an interactive slider.


# Por lo general, los módulos_UI son llamados desde las funciones de layouts
customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions")) # functions in the server side
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts")) # functions in the client side

sapply(c(customFunctions, modules, layouts), source)

ui <- function(request) {
  dashboardPage(skin = "black", header = customHeader, sidebar = customSidebar, body = customBody, 
                title = "validaR - Instituto Nacional de Metrología") #customStuff in ./Layouts
}

server <- function(input, output, session) {
  callModule(definicionesServer, 'definiciones')
  
  #datSeries1 <- callModule(ingresarDatosServer, 'serieMan1')
  #datSeries2 <- callModule(ingresarDatosServer, 'serieMan2')
  
  # Modulos de ingreso de datos
  #datSeriesNames <- reactiveValues()
  datSeriesCompleteDat <- reactiveValues()
  for (i in 1:20) {
    eval(parse(text = paste0('datSeries', i, ' <- callModule(ingresarDatosServer, "serieMan', i, '")')))
    #eval(parse(text = paste0('observe(datSeriesNames$Ser', i, ' <- datSeries', i, '$name)')))
    eval(parse(text = paste0('datSeriesCompleteDat$Serie', i, ' <- datSeries', i)))
    #reactive(eval(parse(text = paste0('datSeriesCompVar.x1$Serie', i, ' <- datSeries', i, '$data()[, 1]'))))
  }
  
  # Modulos de importación de datos -> Esto podrá estar por fuera de las capacidades de la App? Es siquiera necesario?
  # callModule(importarDatosServer, 'serieImp1')
  
  callModule(estadisticaDescriptivaServer, 'Series1EstDesc', series = datSeries1)
  callModule(estadisticaDescriptivaServer, 'Series2EstDesc', series = datSeries2)
  
  callModule(comparacionMediasServer_1, 'mediaVsReferencia', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat)
  callModule(comparacionMediasServer_2, 'dosMedias', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat) 
  
  callModule(comparacionVarianServer_1, 'varianVsReferencia', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat)
  callModule(comparacionVarianServer_2, 'dosVarian', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat) 
  callModule(comparacionVarianServer_m, 'mulVarian', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat)
  
  aovModel <- callModule(comparacionANOVAServer, 'anovaMdl', 
                         nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat)
  callModule(comparacionRanMulServer, 'ranMulAov', aovModel = aovModel)
  
  callModule(comparacionANCOVAServer, 'ancovaMdl', 
             nSeries = reactive(input$numDatSeriesManual), compl = datSeriesCompleteDat)
  
  ### HAY PRUEBA ESTADÏSTICA PARA PROPORCIÖN DE MUESTRAS?
  
  
  
  
  callModule(precisionHorRatServer, 'HorRat1')
  
  #observe({
  #  reactiveValuesToList(input)
  #  session$doBookmark()
  #})
  #onBookmarked(updateQueryString)
}

shinyApp(ui = ui, server = server, enableBookmarking = "server")

#http://www.inm.gov.co/servicio-al-ciudadano/glosario/
# Más bonito:
