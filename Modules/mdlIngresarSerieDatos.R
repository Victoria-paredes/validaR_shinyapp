ingresarDatosUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)
  
  box(title = paste0("Módulo de ingreso serie # ", IntID), width = 12, #height = 150, #solidHeader = TRUE, status = 'primary',
      fluidRow(#column(4, selectInput(ns('natur'), label = "Tipo de datos",
        #                     choices = list('Univariados' = 1, 'Relación de variables: y = f(x)' = 2), selected = 2)),
        column(4, textAreaInput(ns('seriesName'), label = 'Identificador de la serie', height = '80px',
                                placeholder = 'Valores alfanuméricos sin espacios ni caracteres especiales...')),
        column(8, textAreaInput(ns('dataDescrip'), label = 'Descripción de los datos', height = '80px',
                                placeholder = 'Por ejemplo: Muestra XXX002, estudio de precisión bajas 
concentraciones, analista 2; Curva de calibración en blanco de matriz...'))),
      fluidRow(column(1), 
               column(7, box(title = 'Tabla de llenado de datos', width = 12, collapsible = TRUE, collapsed = FALSE, 
                             hotable(ns("TrnsDt")))),
               #actionButton(ns("Add20Rows"), "Añadir 20 filas más")),
               column(4, selectInput(ns('seriesNatur'), label = 'Tipo de datos:',
                                     choices = list('Univariados' = 1, 'Bivariados (y = f(x))' = 2)), 
                      actionButton(ns('inputDat'), "Ingresar datos a la aplicación", styleclass = 'primary', block = TRUE),
                      tags$br(),
                      hotable(ns("TrnsDtEx"))
               )
      )
  )
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
      as.data.frame(hot.to.df(input$TrnsDt))
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
  return(list(data = TrnsDtEx,#[, 1:input$seriesNatur], 
              name = reactive(input$seriesName), descr = reactive(input$dataDescrip)))
  #Considerar poner este return dentro de un actionbutton...
}
