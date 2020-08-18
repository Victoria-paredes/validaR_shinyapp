library(shiny)
library(shinydashboard)

customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions"))
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts"))



sapply(c(customFunctions, modules, layouts), source)

ui <- dashboardPage(skin = "black", customHeader, customSidebar, customBody) #customStuff in ./Layouts

server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)
