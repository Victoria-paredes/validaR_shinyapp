estadisticaDescriptivaUI <- function(id, IntID = 1, value0 = 10) {
  ns <- NS(id)

  box(title = paste0("Descriptores estadísticos Serie # ", IntID), width = 6, status = 'primary',# solidHeader = TRUE, 
      tableOutput(ns('dataseries')),
      infoBox(title = '', width = 12, value = htmlOutput(ns('niceCurvEq')), color = 'aqua', icon = icon("chart-line"))
      )
}

estadisticaDescriptivaServer <- function(input, output, session, series) {
  dataF <- reactive(series$data())
  
  output$dataseries <- renderTable(dataF())
  
  dscrptX1 <- reactive(paste0("Promedio = ", signif(mean(dataF()[, 1]), 4), " <br />",
                              "Desv. Estándar = ", signif(sd(dataF()[, 1]), 4)," <br /><br />",
                              "Número de datos = ", nrow(dataF()),
                                            "&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;\u00b1("))
  #dscrptX1 <- reactive(paste0(str(series$data())))
  output$niceCurvEq <- renderText(dscrptX1())
  
  
  
  #return(reactive(list(data = na.rm(MyChanges()), name = input$seriesName(), descr = input$dataDescrip)))
}
