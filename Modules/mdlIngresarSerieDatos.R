ingresarDatosUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)

  box(title = paste0("Módulo de ingreso de datos manuales."), width = 12, #solidHeader = TRUE, status = 'primary',
      fluidRow(column(4, selectInput(ns('natur'), label = "Tipo de datos",
                                     choices = list('Univariados' = 1, 'Relación de variables: y = f(x)' = 2), selected = 2)),
               column(8, textInput(ns('seriesName'), label = 'Identificador de la serie',
                                   placeholder = 'Valores alfanuméricos sin espacios ni caracteres especiales...'))),
      textInput(ns('dataDescrip'), label = 'Descripción de los datos', width = '100%',
                placeholder = 'Por ejemplo: Muestra XXX002, estudio de precisión bajas concentraciones, analista 2'),
      sliderInput(ns("nData"), label = "Numero de filas (Reinicie la tabla a ceros para modificar)", width = '100%',
                  min = 2, max = 100, round = TRUE, value = value0),
      fluidRow(column(3, hotable(ns("TrnsDt"))),
               column(3, actionButton(ns("inputData"), label = 'Cargar datos', styleclass = 'primary', block = TRUE),
                      actionButton(ns("resetData"), label = 'Reiniciar tabla a ceros (pendiente)', 
                                   styleclass = 'danger', block = TRUE)),
               column(5, hotable(ns("TrnsfrmdDt"))))
      )
}

ingresarDatosServer <- function(input, output, session) {
  
  TrnsDt0 <- reactive({
    if (input$natur == 1) {
      data.frame(Var.X1  = rep(NA, as.numeric(input$nData)),
                 Var.X2  = rep(NA, as.numeric(input$nData)))
    } else {
      if (input$natur == 2) {
        data.frame(Var.X1  = rep(NA, as.numeric(input$nData)),
                   Var.X2  = rep(NA, as.numeric(input$nData)),
                   Var.X3  = rep(NA, as.numeric(input$nData)))
      }
    }
  })
  
  erase <- reactiveVal(FALSE)
  observeEvent(input$resetData, {
    erase(TRUE) # tampoco funcionó prros :'c
    #updateHotable() Esto no parece existir... preguntar en stackOverflow
  })
  
  TrnsDtMyChanges <- reactive({
    #input$inputData
    TempDatFram1 <- data.frame(apply(as.data.frame(hot.to.df(input$TrnsDt)), 2, function(x) as.numeric(as.character(x))))
    ifelse(isTruthy(all(is.na(hot.to.df(input$TrnsDt)))),
           return(TrnsDt0()),
           return(TempDatFram1)
    ) #hot.to.df function will convert your updated table into the dataframe
  })
  output$TrnsDt <- renderHotable({TrnsDtMyChanges()}, readOnly = FALSE)
  output$TrnsfrmdDt <- renderHotable({TrnsDtMyChanges()}, readOnly = TRUE)
  #transDat <- reactive(TrnsDtMyChanges()
  #ModelReactive <- reactive(Model$Model())
  #output$model(renderText(Model$catModel))
  return(reactive(list(TrnsDtMyChanges(), input$seriesName())))
}
