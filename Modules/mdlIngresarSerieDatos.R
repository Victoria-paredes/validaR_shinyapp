ingresarDatosUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)
  
  column(4, box(title = paste0("Módulo de ingreso para la serie # ", IntID), width = 12, status = 'primary',#height = 150, #solidHeader = TRUE, 
      fluidRow(#column(4, selectInput(ns('natur'), label = "Tipo de datos",
        #                     choices = list('Univariados' = 1, 'Relación de variables: y = f(x)' = 2), selected = 2)),
        #column(4, textAreaInput(ns('seriesName'), label = 'Identificador de la serie', height = '80px', 
        #                        value = paste0("Serie_", IntID),
        #                        placeholder = 'Valores alfanuméricos sin espacios ni caracteres especiales...')),
        column(12, textAreaInput(ns('dataDescrip'), label = 'Descripción de la serie de datos', rows = 3,
                                 placeholder = 'Mensurando, condiciones del experimento, etc.'))),
      fluidRow(column(8, box(title = 'Tabla de llenado de datos', width = 12, collapsible = TRUE, collapsed = FALSE, 
                             hotable(ns("TrnsDt")))),
               #actionButton(ns("Add20Rows"), "Añadir 20 filas más")),
               column(4, selectInput(ns('seriesNatur'), label = 'Tipo de datos:',
                                     choices = list('Datos univariados' = 1, 'Regresión' = 2,
                                                    'Regresión con incertidumbre' = 3)), 
                      actionButton(ns('inputDat'), "Cargar datos", styleclass = 'primary', block = TRUE),
                      tags$br(),
                      hotable(ns("TrnsDtEx"))
               )
      )
  ))
}


ingresarDatosServer <- function(input, output, session) {
  
  TrnsDt0 <- reactive(
    data.frame(var.X1  = rep(NA, 15),
               var.X2  = rep(0, 15),
               var.X3  = rep(0, 15),
               var.X4  = rep(0, 15)))
  #Intentar un boton de agregar más filas -> Podrían ser más hotables... se pueden imprimir sin encabezados? Se pueden unir al final?
  
  MyChanges <- reactive({
    if(is.null(input$TrnsDt)){return(TrnsDt0())}
    else if(!identical(TrnsDt0(), input$TrnsDt)){
      # hot.to.df function will convert your updated table into the dataframe
      #as.data.frame(hot.to.df(input$TrnsDt))
      return(data.frame(apply(as.data.frame(hot.to.df(input$TrnsDt)), 2, function(x) as.numeric(as.character(x)))))
    }
  })
  output$TrnsDt <- renderHotable({MyChanges()}, readOnly = FALSE)
  
  TrnsDtEx <- eventReactive(input$inputDat, na.omit(MyChanges()))
  output$TrnsDtEx <- renderHotable({TrnsDtEx()}, readOnly = TRUE)
  
  
  #TrnsDtMyChanges <- reactive({
    #input$inputData
  #  TempDatFram1 <- data.frame(apply(as.data.frame(hot.to.df(input$TrnsDt)), 2, function(x) as.numeric(as.character(x))))
  #  ifelse(isTruthy(all(is.na(hot.to.df(input$TrnsDt)[, 1]))),
  #         return(TrnsDt0()),
  #         return(TempDatFram1)
  #  ) #hot.to.df function will convert your updated table into the dataframe
  #})
  
  #output$TrnsDt <- renderHotable({TrnsDtMyChanges()}, readOnly = FALSE)
  #output$TrnsfrmdDt <- renderHotable({MyChanges()}, readOnly = TRUE)
  #transDat <- reactive(TrnsDtMyChanges()
  #ModelReactive <- reactive(Model$Model())
  #output$model(renderText(Model$catModel))
  return(list(data = TrnsDtEx, #name = reactive(input$seriesName), 
              descr = reactive(input$dataDescrip), 
              natur = reactive(input$seriesNatur)))
  #Considerar poner este return dentro de un actionbutton...
}
