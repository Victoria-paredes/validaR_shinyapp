lyEstadDescrDscrp <- infoBox(
  width = 9, "Instrucciones", color = 'light-blue', icon = icon("info-circle"),
  h4("Esta sección genera descriptores estadísticos de conjuntos de datos univariados. Se debe seleccionar un conjunto de datos y una
      variable (columna) a la vez. Al presionar ", tags$b("Calcular"), 
     "se obtienen distintos resultados sobre los datos seleccionados:",
     tags$br(),
     HTML('&emsp;'), "• El recuadro de", tags$b("descriptores estadísticos"),
     "muestra distintas medidas de tendencia central y de dispersión.", 
     tags$br(),
     HTML('&emsp;'), "• Las", tags$b("pruebas de normalidad"), 
     "tratan de inferir si los datos provienen de una población con distribución normal.", 
     tags$br(), HTML('&emsp;&emsp;&nbsp;'), 
     "Las pruebas que se utilizan son las de Shapiro-Wilk y Kolmogorov-Smirnof.", 
     tags$br(),
     HTML('&emsp;'), "• El recuadro de", tags$b("posibles anómalos"), "usa las pruebas de Grubbs y de Dixon para señalar posibles
      datos anómalos en la serie.", 
     tags$br(), HTML('&emsp;&emsp;&nbsp;'), 
     "Es importante considerar que un posible dato anómalo no debe descartarse sin antes considerar ", 
     tags$br(), HTML('&emsp;&emsp;&nbsp;'), 
     "las posibles causas que pueda tener su comportamiento anormal."))
