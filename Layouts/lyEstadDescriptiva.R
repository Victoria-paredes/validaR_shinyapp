lyEstadDescrDscrp <- infoBox(
  width = 12, "Instrucciones", color = 'navy', icon = icon("info-circle"),
  h5("Esta sección genera descriptores estadísticos y otra información de utilidad de un conjunto de datos univariados.
      Para obtener la información primero debe cargar los datos en la sección", icon("hockey-puck"), tags$b("Ingreso de datos,"),
     "posteriormente, en el recuadro", tags$b("datos a analizar"), "debe seleccionar la serie que ingresó y 
     una variable (columna) donde está la información que desea describir.", tags$br(), "Al presionar el botón", tags$b("Calcular"), 
     "se obtienen distintos resultados sobre los datos seleccionados:",
     tags$br(), tags$br(),
     tags$ul(
       tags$li("El recuadro de", tags$b("descriptores estadísticos"), "presenta distintas 
               medidas de tendencia central y de dispersión de la muestra estadística."), tags$br(),
       tags$li("En ", tags$b("diagramas"), "se generan tres gráficos:",
               tags$ol(
                 tags$li("Histograma con gráfico de densidad para evaluar la distribución de los datos. Este gráfico
                         permite configurar el número de secciones del gráfico, alterándo el ancho de las barras."),
                 tags$li("Gráfico de puntos apilados, también para evaluar la distribución de los datos."),
                 tags$li("Gráfico cuartil cuartil (Q-Q) que se emplea para determinar si los datos provienen
                        de una población con distribución normal, en cuyo caso los valores tenderán a ubicarse sobre la 
                        línea diagonal azul."))), tags$br(),
       tags$li("Las", tags$b("pruebas de normalidad"), "complementan el gráfico Q-Q descrito anteriormente. Estas pruebas hacen
                inferencias estadísticas para concluír, a un determinado nivel de confianza, 
                si los datos provienen de una población con distribución normal. Las pruebas que se utilizan son las 
               de Shapiro-Wilk y de Kolmogorov-Smirnof."), tags$br(),
       tags$li("El recuadro de", tags$b("pruebas de datos anómalos"), "usa los criterios de Grubbs y de Dixon para señalar posibles
                datos anómalos en la serie escogida. Acá es importante considerar que un dato que es señalado
                como posible anómalo no debe descartarse sin antes evaluar cuidadosamente
                las posibles causas que pueda tener su comportamiento anormal. En algunos casos los datos anómalos permiten hacer 
                hallazgos que conducen a un mejor conocimiento del sistema."))
     ))

lyEstadDrescrCitat <- box(title = NULL, status = 'primary', width = 12, 
                          tags$h5('Pruebas de anómalos de Grubbs y de Dixon implementados en R por el paquete ', 
                                  tags$b('outliers'), ' [Komsta, 2011].'))