library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2) #Grammar of graphics
library(rhandsontable)
library(shinysky)
library(purrr) #map-like functional programing

#library(ggvis) #ggvis: Interactive Grammar of Graphics - input_slider: Create an interactive slider.

customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions")) # functions in the server side
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts")) # functions in the client side



sapply(c(customFunctions, modules, layouts), source)

ui <- function(request) {
  dashboardPage(skin = "black", customHeader, customSidebar, customBody) #customStuff in ./Layouts
}

server <- function(input, output, session) {
  callModule(definicionModule, 'definiciones')
  callModule(mdlPrecisionHorRat, 'HorRat1')
  
  datSeries1 <- callModule(inputDataModule, 'serieMan1')
  callModule(importDataModule, 'serieImp1')
  
  #observe({
  #  reactiveValuesToList(input)
  #  session$doBookmark()
  #})
  #onBookmarked(updateQueryString)
}

shinyApp(ui = ui, server = server, enableBookmarking = "server")

#http://www.inm.gov.co/servicio-al-ciudadano/glosario/
# Más bonito:
