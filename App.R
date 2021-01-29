library(shiny)
library(shinydashboard)
library(dashboardthemes) #https://cran.r-project.org/web/packages/dashboardthemes/vignettes/using_dashboardthemes.html
library(shinyWidgets)
library(ggplot2) #Grammar of graphics
library(shinysky)
library(rhandsontable)
library(purrr) # map-like functional programing (?)
library(BHH2) # dotPlot(faithful$waiting, pch = 16)

#actionButton <- shiny::actionButton() #Unmask actionbutton
#library(pracma) # ODR
#library(ggvis) #ggvis: Interactive Grammar of Graphics - input_slider: Create an interactive slider.


# Por lo general, los módulos_UI son llamados desde las funciones de layouts
customFunctions <- paste0('CustomFunctions/', list.files(path = "CustomFunctions")) # functions in the server side
modules         <- paste0('Modules/', list.files(path = "Modules"))
layouts         <- paste0('Layouts/', list.files(path = "Layouts")) # functions in the client side
sapply(c(customFunctions, modules, layouts
         ), source)

ui <- function(request) {
  dashboardPage(header = customHeader, sidebar = customSidebar, body = customBody, 
                title = "validaR - Instituto Nacional de Metrología") #customStuff in ./Layouts
  # tags$script(HTML("if (window.innerHeight < 400) alert('Screen too small');")) ??????????????????
}

server <- function(input, output, session) {
  formatP  <- reactive(input$Format)
  dimensP  <- reactive(c(input$plotsW, input$plotsH) / 25.4 * 1.6)
  nRows <- reactive(input$nRows)
  nSeries <- reactive(input$numDatSeriesManual)
  
  callModule(definicionesServer, 'definiciones')
  
  # Modulos de ingreso de datos
  datSrsCmplt <- reactiveValues()
  for (i in 1:20) {
    eval(parse(text = paste0('datSeries', i, ' <- callModule(ingresarDatosServer, "serieMan', i, '", nRows = nRows)')))
    #eval(parse(text = paste0('observe(datSeriesNames$Ser', i, ' <- datSeries', i, '$name)')))
    eval(parse(text = paste0('datSrsCmplt$Serie', i, ' <- datSeries', i)))
    #reactive(eval(parse(text = paste0('datSeriesCompVar.x1$Serie', i, ' <- datSeries', i, '$data()[, 1]'))))
  }
  
  # Datos de los ejemplos
  callModule(datosEjemploServer, 'examples')
  
  # Modulos de importación de datos -> Esto podrá estar por fuera de las capacidades de la App? Es siquiera necesario?
  # callModule(importarDatosServer, 'serieImp1')
  
  #Estadística descriptiva e inferencial
  callModule(estadisticaDescriptivaServer, 'EstDesc', nSeries = nSeries, compl = datSrsCmplt, formatP = formatP, dimensP = dimensP)
  callModule(comparacionMediasServer_1, 'mediaVsReferencia', nSeries = nSeries, compl = datSrsCmplt)
  callModule(comparacionMediasServer_2, 'dosMedias', nSeries = nSeries, compl = datSrsCmplt)
  callModule(comparacionVarianServer_1, 'varianVsReferencia', nSeries = nSeries, compl = datSrsCmplt)
  callModule(comparacionVarianServer_2, 'dosVarian', nSeries = nSeries, compl = datSrsCmplt) 
  callModule(comparacionVarianServer_m, 'mulVarian', nSeries = nSeries, compl = datSrsCmplt)
  aovMdl <- callModule(comparacionANOVAServer, 'anovaMdl', nSeries = nSeries, compl = datSrsCmplt, formatP = formatP, dimensP = dimensP)
  callModule(comparacionRanMulServer, 'ranMulAov', aovModel = aovMdl, formatP = formatP, dimensP = dimensP)
  # https://www.tenderisthebyte.com/blog/2019/04/25/rotating-axis-labels-in-r/
  callModule(comparacionANCOVAServer, 'ancovaMdl', nSeries = nSeries, compl = datSrsCmplt, formatP = formatP, dimensP = dimensP)
  ### HAY PRUEBA ESTADÏSTICA PARA PROPORCION DE MUESTRAS?
  
  # Regresiones
  callModule(regresionServer, 'regModel1', nSeries = nSeries, compl = datSrsCmplt, formatP = formatP, dimensP = dimensP) 
  
  #Parámetros de validación
  callModule(precisionHorRatServer, 'HorRat1')
  callModule(robustezServer, 'robustez')
  #observe({
  #  reactiveValuesToList(input)
  #  session$doBookmark()
  #})|
  #onBookmarked(updateQueryString)
}

shinyApp(ui = ui, server = server, enableBookmarking = "url")

#http://www.inm.gov.co/servicio-al-ciudadano/glosario/
# Más bonito:
