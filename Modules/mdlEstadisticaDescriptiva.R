estadisticaDescriptivaUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)

  box(title = paste0("Descriptores estadísticos Serie # ", IntID), width = 6, status = 'primary',# solidHeader = TRUE, 
      tableOutput(ns('dataseries'))
      )
}

estadisticaDescriptivaServer <- function(input, output, session, series) {
  
  output$dataseries <- renderTable(series$data())
  
  
  #return(reactive(list(data = na.rm(MyChanges()), name = input$seriesName(), descr = input$dataDescrip)))
}
