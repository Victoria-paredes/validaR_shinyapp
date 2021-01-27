#lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramientas de estadística inferencial", color = 'light-blue',
#                           "Las pruebas de comparación...")
#lyPruebasComparacion <- box(width = 12,
#                            lyPruebasComparacionDscrp)

lyCompMediasDscrp <- infoBox(
  width = 12, "Instrucciones", color = 'navy',
  h5("Este módulo permite comparar una media muestral contra un valor de referencia o contra
     otra media muestral.", tags$br(), tags$br(),
    tags$ul(
      tags$li(
        'Para comparar una media muestral contra un valor de referencia:',
        tags$ol(
          tags$li("Los datos deben estar previamente cargados en la sección", icon("hockey-puck"), tags$b("Ingreso de datos."),
                  "Los conjuntos de datos a estudias deben ser de naturaleza univariada. Si la serie de datos que se 
                  escoje contiene varias columnas activas, la aplicación solo tiene en cuenta la primera de estas."),
          tags$li("Se debe ingresar el valor de referencia para la media poblacional y una hipótesis alternativa 
                  para la comparación. El valor de referencia debe encontrarse en las mismas unidades que los datos de la 
                  muestra estadística a comparar."),
          tags$li("Se debe escoger un nivel de confianza para la inferencia estadística y al presional el botón",
                  tags$b('Correr análisis'), "aparecerán los resultados de la prueba"))), tags$br(),
      tags$li('Para comparar una media muestral contra otra media muestral:',
        tags$ol(
          tags$li("Los datos deben estar previamente cargados en la sección", icon("hockey-puck"), tags$b("Ingreso de datos."),
                  "Se necesitan dos series de datos que pueden ser independientes o puede tratarse de datos emparejados.
                  Para el caso de los datos emparejados las series deben tener el mismo tamaño."),
          tags$li("Se debe escoger una hipótesis alternativa y un nivel de confianza para la comparación."),
          tags$li("Si la comparación se hará en datos emparejados debe activarse esta opción."),
          tags$li("Al presional el botón", tags$b('Correr análisis'), "aparecerán los resultados de la prueba."),
          tags$li("Si las muestras estadísticas son independientes, la aplicación automáticamente verifica 
                  si se trata de series homocedásticas o heterocedásticas, para calcular el estadístico", tags$b('t'), 
                  'que corresponda según el caso.'))), tags$br(),
      tags$li('Para  comparar las medias de más de dos grupos muestrales por favor diríjase a la sección', 
              tags$b('Análisis de varianza (ANOVA).')))))

lyCompMedias <- fluidRow(column(12, 
                                box(title = tags$b('Media muestral contra un valor de referencia (prueba t)'), width = 6, 
                                    status = 'primary', height = 700, comparacionMediasUI_1('mediaVsReferencia')),
                               box(title = tags$b('Media muestral contra otra media muestral (prueba t)'), 
                                   width = 6, status = 'primary',
                                   height = 700, comparacionMediasUI_2('dosMedias'))), tags$br())

lyCompVarianDscrp <- infoBox(
  width = 12, "Instrucciones", color = 'navy',
  h5("Este módulo permite comparar la dispersión (varianza) de una muestra estadística contra un valor de 
    referencia, respecto a otra muestra estadística, o en un conjunto de varias muestras estadísticas.", 
    tags$br(), tags$br(),
    tags$ul(
      tags$li('Para comparar una varianza muestral contra un valor de referencia:',
              tags$ol(
                tags$li("Los datos deben estar previamente cargados en la sección", icon("hockey-puck"), tags$b("Ingreso de datos."),
                        "Los conjuntos de datos a estudias deben ser de naturaleza univariada. Si la serie de datos que se 
                        escoje contiene varias columnas activas, la aplicación solo tiene en cuenta la primera de estas."),
                tags$li("Se debe ingresar el valor de referencia y se debe indicar la naturaleza de dicho valor. La aplicación
                        acepta como referencia un valor de varianza, de desviación estándar, o de desviación estándar relativa."),
                tags$li("Se debe escoger un nivel de confianza para la inferencia estadística y al presional el botón",
                        tags$b('Correr análisis'), "aparecerán los resultados de la prueba"))), tags$br(),
      tags$li('Para comparar las varianzas muestrales de dos conjuntos de datos independientes:',
              tags$ol(
                tags$li("Los datos deben estar previamente cargados en la sección", icon("hockey-puck"), 
                        tags$b("Ingreso de datos.")),
                tags$li("Se debe escoger una hipótesis alternativa y un nivel de confianza para la comparación."),
                tags$li("Al presional el botón", tags$b('Correr análisis'), "aparecerán los resultados de la prueba."))), tags$br(),
      tags$li('Para  comparar las medias de más de dos grupos muestrales El procedimiento a seguis es similar al caso anterior.
              Están disponibles cuatro pruebas de inferencia estadística que funcionan de manera similar:',
              tags$ol(
                tags$li(tags$b('Prueba de Barlett:'), 'Esta prueba hace uso del estadístico \\(K^2\\) de Bartlett que presenta
                        una distribución aproximada al estadístico \\(\\chi^2\\), para evaluar la hipótesis nula de que
                        todas las varianzas son iguales, contra la hipótesis alternativa de que al menos una no lo es.'),
                tags$li(tags$b('Prueba de Levene:'), 'Calcula el estadístico \\(W\\) para evaluar la hipótesis nula de que
                        todas las varianzas son iguales, contra la hipótesis alternativa de que al menos una no lo es. 
                        La prueba de Levene tiene una versión más robusta que hace uso de la mediana como medida de tendencia central
                        en lugar del promedio. Esta variación (prueba de Brown–Forsythe) se considera más robusta y es apropiada
                        cuando los datos no tienen una distribución normal.'),
                tags$li(tags$b('Prueba de Hartley:'), 'Esta prueba realiza una comparación de varianzas entre 
                        las muestras estadísticas con la varianza más grande y la más pequeña, respectivamente. La relación entre
                        varianzas más grande de entre los conjuntos de datos (\\(F_{max}\\)) sigue una distribución especial
                        que permite hacer inferencias sobre la homocedasticidad del conjunto de datos.'),
                tags$li(tags$b('Prueba de Cochran:'), 'Evalúa de manera independiente la varianzas más grande y la varianza más pqueña,
                        para concluír si alguna de estas puede considerarse como anómala dentro del grupo de varianzas muestrales
                        que se están comparando.')
              )))))
lyCompVarian <- fluidRow(column(12, 
                                box(title = tags$b('Varianza muestral contra un valor de referencia (prueba \\(\\chi^2\\))'), 
                                    solidHeader = FALSE, width = 6, status = 'primary',
                                    comparacionVarianUI_1('varianVsReferencia')),
                                box(title = tags$b('Varianza muestral contra otra varianza muestral (Prueba F)'), 
                                    width = 6, status = 'primary',
                                    solidHeader = FALSE, comparacionVarianUI_2('dosVarian')),
                                box(title = tags$b('Comparación de varianzas muestrales de más de dos conjuntos de datos'), 
                                    width = 12, status = 'primary', #height = 510, 
                                    comparacionVarianUI_m('mulVarian')),
                                box(title = NULL, status = 'primary', width = 12, 
                                    tags$h5('Prueba de \\(\\Chi^2\\) implementada en R por el paquete ', tags$b('EnvStats'), 
                                            ' [Millard, 2011]'),
                                    tags$h5('Prueba de Cochran implementada en R por el paquete ', tags$b('outliers'), 
                                            ' [Komsta, 2011]'),
                                    tags$h5('Prueba de Hartley implementada en R por el paquete ', tags$b('PMCMRplus'), 
                                            ' [Pohlert, 2020]'),
                                    tags$h5('Prueba de Levene implementada en R por el paquete ', tags$b('car'), 
                                            ' [Fox y Weisberg, 2019]'))))

lyCompANOVADscrp <- infoBox(width = 12, "Instrucciones", color = 'navy',
                         h5("El análisis de varianza (ANOVA) compara simultáneamente las medias muestrales de conjuntos de datos,
                            para determinar si al menos una de las diferencias entre los grupos es estadísticamente
                            significativa. Para llevar a cabo el análisis:", tags$br(), tags$br(), 
                            tags$ol(
                              tags$li("Los datos deben estar previamente cargados en la sección", icon("hockey-puck"), 
                                      tags$b("Ingreso de datos."),
                                      "Los conjuntos de datos a estudias deben ser de naturaleza univariada. 
                                      Si la serie de datos que se escoje contiene varias columnas activas, 
                                      la aplicación solo tiene en cuenta la primera de estas."), tags$br(), 
                              tags$li('Deben escogerse los grupos a comparar y un nivel de confianza para la inferencia.'), tags$br(), 
                              tags$li('Al presionar el botón', tags$b('Correr análisis'), "aparecerán distintos resultados:",
                                      tags$br(),
                                      tags$ul(
                                        tags$li('En la sección de', tags$b('Supuestos del análisis'), 'se verifican mendiante pruebas
                                                de hipótesis si los supuestos del ANOVA se cumplen. La validez de las conclusiones
                                                que se obtengan con el análisis dependen fuertemente de que dichos supuestos 
                                                sean razonables para los conjuntos de datos que se estudian:', tags$br(),
                                                tags$ul(
                                                  tags$li('Las muestras estadísticas provienen de poblaciones con
                                                          distribución normal.'),
                                                  tags$li('No hay datos anómalos dentro de los grupos.'),
                                                  tags$li('Las varianzas de las muestras estadísticas son homogéneas. En otras
                                                          palabras, hay homocedasticidad entre las series.'))))), tags$br(), 
                              tags$li("Si el análisis de la prueba indica que los resultados son estadísticamente significativos  
                                      el recuadro de ", tags$b("Pruebas Post Hoc"), "efectua pruebas de detección 
                                      de diferencias entre grupos para identificar cuales son los grupos que presentan 
                                      diferencias entre sí. Al presionar el botón", tags$b('Analizar datos de ANOVA'),
                                      "se obienen los resultados de tres pruebas similares de inferencia estadística:", tags$br(),
                                      tags$ul(
                                        tags$li(tags$b('Diferencia mínima significativa de Fisher: Esta prueba es similar a
                                                       realizar distintas pruebas t de comparación de dos medias muestrales
                                                       corrigiendo la significancia de cada prueba para evitar la
                                                       inflación de los errores tipo I.', '')),
                                        tags$li(tags$b('Diferencias significativas de Tukey:', '')),
                                        tags$li(tags$b('Rángos múltiples de Duncan:', '')))))))

lyCompANOVA <- fluidRow(comparacionANOVAUI('anovaMdl'),
                        #column(6, box(title = tags$b('Análisis de varianza'), width = 12, status = 'primary',
                                      #height = 400, comparacionANOVAUI('anovaMdl'))),
                    column(12, box(title = tags$b('Pruebas Post Hoc'), width = 12, status = 'primary',
                                   height = 1080,
                                   comparacionRanMulUI('ranMulAov')),
                           box(title = NULL, status = 'primary', width = 12, 
                               tags$h5('Prueba de Duncan para rangos múltiples y prueba de Fisher para diferencia mínima 
                                       significativa implementadas en R por el paquete ', tags$b('agricolae'), 
                                       ' [Mendiburu, 2020]'))))

lyCompANCOVADscrp <- infoBox(width = 12, "Análisis de covarianza", color = 'navy',
                            h5("El análisis de covarianza (ANCOVA) permite identificar diferencias entre dos o más conjuntos de datos
                                cuando estos presentan al menos una covariable en común, y se desea corregir el efecto de dichas 
                                covariables. ANCOVA tiene los siguientes supuestos:", tags$br(),
                               tags$ul(
                                 tags$li('Hay una relación lineal entre la covariable y la variable respuesta.'), 
                                 tags$li('Las pendientes de la regresión sin similares.'),
                                 tags$li("Los residuales de regresión tienen distribución normal."),
                                 tags$li('Hay homogeneidad de varianzas en los residuales de los grupos'),
                                 tags$li('Hay ausencia de datos anómalos en los grupos'), tags$br()),
                                "Para llevar a cabo el ANCOVA:", tags$br(),
                               tags$ol(
                                 tags$li('Los datos deben estar previamente cargados en la sección', icon("hockey-puck"), 
                                      tags$b("Ingreso de datos."), 'Las series a analizar deben ser de naturaleza bivariada, donde
                                      la variable dependinte es la que se desea comparar y la variable independiente es la 
                                      covariable cuyo efecto quiere corregirse. Las columnas de las series de datos deben coincidir
                                      entre sí.'), tags$br(),
                                 tags$li('Seleccionar que columnas corresponden a la variable respuesta y a la covariable, en las
                                         tablas de datos que se ingresaron en el punto anterior.'), tags$br(),
                                 tags$li('Escoger un nivel de confianza para la muestra. Al presionar el botón', 
                                         tags$b('Analizar datos de ANOVA'), 'se obienen resultados gráficos que muestran la
                                         relación entre la variable estudiada y la covariable, '))))

lyCompANCOVA <- fluidRow(column(6, box(title = tags$b('Analisis de covarianza '), width = 12, status = 'primary',
                                      height = 500, comparacionANCOVAUI('ancovaMdl'))))