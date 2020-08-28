library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(ggplot2)
library(rhandsontable)
library(shinysky)

#library(ggvis) #ggvis: Interactive Grammar of Graphics - input_slider: Create an interactive slider.

customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions"))
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts"))



sapply(c(customFunctions, modules, layouts), source)

ui <- dashboardPage(skin = "black", customHeader, customSidebar, customBody) #customStuff in ./Layouts

server <- function(input, output, session) {
  callModule(definicionModule, 'definiciones')
  callModule(mdlPrecisionHorRat, 'HorRat1')
  
  datSeries1 <- callModule(inputDataModule, 'serieMan1')
  callModule(importDataModule, 'serieImp1')
  
}

shinyApp(ui = ui, server = server)

#http://www.inm.gov.co/servicio-al-ciudadano/glosario/
# Más bonito:
