library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2) #Grammar of graphics
library(rhandsontable)
library(shinysky)
library(purrr) #map-like functional programing

#library(ggvis) #ggvis: Interactive Grammar of Graphics - input_slider: Create an interactive slider.


# Por lo general, los módulos son llamadas desde las funciones de layouts
customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions")) # functions in the server side
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts")) # functions in the client side



sapply(c(customFunctions, modules, layouts), source)

ui <- function(request) {
  dashboardPage(skin = "black", header = customHeader, sidebar = customSidebar, body = customBody, 
                title = "Validación de métodos analíticos Instituto Nacional de Metrología") #customStuff in ./Layouts
}

server <- function(input, output, session) {
  callModule(definicionesServer, 'definiciones')
  
  datSeries1 <- callModule(ingresarDatosServer, 'serieMan1')
  datSeries2 <- callModule(ingresarDatosServer, 'serieMan2')
  callModule(importarDatosServer, 'serieImp1')
  
  callModule(estadisticaDescriptivaServer, 'Series1EstDesc', series = datSeries1)
  callModule(estadisticaDescriptivaServer, 'Series2EstDesc', series = datSeries2)
  
  callModule(comparacionMediasServer_1, 'mediaVsReferencia')
  callModule(comparacionMediasServer_2i, 'dosMedias')
  callModule(comparacionMediasServer_2p, 'dosMerdiasPareadas')
  
  
  
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
