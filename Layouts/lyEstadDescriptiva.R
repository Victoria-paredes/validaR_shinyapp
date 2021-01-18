lyEstadDescrDscrp <- infoBox(
  width = 12, "Instrucciones", color = 'navy', icon = icon("info-circle"),
  h5("Esta sección genera descriptores estadísticos de conjuntos de datos univariados. Para hacer esto, 
      se debe seleccionar un conjunto de datos y una
      variable (columna) donde está la información que se desea analizar. Al presionar ", tags$b("Calcular"), 
     "se obtienen distintos resultados sobre los datos seleccionados:",
     tags$br(),
     tags$ul(
       tags$li("El recuadro de", tags$b("descriptores estadísticos"), "presenta distintas 
               medidas de tendencia central y de dispersión."),
       tags$li("En ", tags$b("diagramas"), "se genera un histograma y un gráfico de puntos apilados para evaluar 
               la distribución de los datos, y el gráfico de cuartil cuartil (Q-Q) que ayuda a evaluar si los datos provienen
               de una población con distribución normal. El histograma permite configurar el número de secciones (barras) en las que
               se divide el área del gráfico."),
       tags$li("Las", tags$b("pruebas de normalidad"), "complementan el gráfico Q-Q descrito anteriormente 
                para inferir si los datos provienen de una población con distribución normal. Las pruebas que se utilizan son las 
               de Shapiro-Wilk y de Kolmogorov-Smirnof."),
       tags$li("El recuadro de", tags$b("pruebas de datos anómalos"), "usa los criterios de Grubbs y de Dixon para señalar posibles
                datos anómalos en la serie escogida. Acá es importante considerar que un dato que es señalado
                como posible anómalo no debe descartarse sin antes considerar (y cuando haya lugar, corregir)
                las posibles causas que pueda tener su comportamiento anormal."))
     ))

lyEstadDrescrCitat <- box(title = NULL, status = 'primary', width = 12, 
                          tags$h5('Pruebas de anómalos de Grubbs y de Dixon implementados en R por el paquete ', 
                                  tags$b('outliers'), ' [Komsta, 2011].'))