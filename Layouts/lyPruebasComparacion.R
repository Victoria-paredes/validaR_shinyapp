#lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramientas de estadística inferencial", color = 'light-blue',
#                           "Las pruebas de comparación...")
#lyPruebasComparacion <- box(width = 12,
#                            lyPruebasComparacionDscrp)

lyCompMediasDscrp <- infoBox(width = 12, "Instrucciones", color = 'navy',
                             h5("Este módulo permite comparar una media muestral contra un valor de referencia o contra
                                otra media muestral. Para el caso de dos medias muestrales, los datos de las muestras estadísticas 
                                pueden ser independientes o puede tratarse de datos emparejados.", tags$br(), tags$br(),
                                "Los conjuntos de datos a analizar deben ser de naturaleza univariada. 
                                Si la serie de datos que se escoje contiene varias 
                                columnas activas, la aplicación solo tiene en cuenta la primera de estas.
                                En todos los casos se debe escoger una hipótesis alternativa y un nivel de confianza para la prueba.
                                Por defecto las pruebas son bilaterales y se evaluan a un nivel de confianza del 95%.", 
                                tags$br(), tags$br(),
                                tags$ul(
                                  tags$li('Comparar una media muestral contra un valor de referencia requiere un conjunto de datos y
                                          un valor de referencia que debe estar en las mismas unidades que los valores del conjunto de 
                                          datos que  compone la muestra estadística.'),
                                  tags$li('Para comparar dos muestras estadísticas es necesario escoger los conjuntos de datos que
                                          pueden ser independientes 
                                          o pueden estar emparejados, en cuyo caso debe activarse la opción de muestras emparejadas
                                          antes de correr el análisis.
                                          Si las muestras estadísticas son independientes, la aplicación automáticamente verifica 
                                          si puede asumirse homogeneidad de varianzas, para calcular el estadístico', tags$b('t'), 
                                          'que corresponda según el caso.'),
                                  #tags$li(''),
                                  tags$li('Para  comparar las medias de más de dos grupos muestrales por favor diríjase a la 
                                          sección', tags$b('Análisis de varianza (ANOVA).')))))
lyCompMedias <- fluidRow(column(12, 
                                box(title = tags$b('Media muestral contra un valor de referencia (prueba t)'), width = 6, 
                                    status = 'primary', height = 700, comparacionMediasUI_1('mediaVsReferencia')),
                               box(title = tags$b('Media muestral contra otra media muestral (prueba t)'), 
                                   width = 6, status = 'primary',
                                   height = 700, comparacionMediasUI_2('dosMedias'))), tags$br())

lyCompVarianDscrp <- infoBox(width = 12, "Instrucciones", color = 'navy',
                             h5("Este módulo permite comparar la dispersión de las muestras estadísticas ingresadas a la aplicación.", 
                                tags$br(), tags$br(),
                                "Si la serie de datos que se escoje contiene varias 
                                columnas activas, la aplicación solo tiene en cuenta la primera de estas.
                                En todos los casos se debe escoger una hipótesis alternativa 
                                (excepto en las pruebas de más de dos muestras estadísticas), y un nivel de confianza para la prueba.
                                Por defecto las pruebas son bilaterales y se evaluan a un nivel de confianza del 95%.",
                                tags$ul(
                                  tags$li("La comparación de una varianza muestral contra un valor de referencia permite comparar 
                                          la dispersión del conjunto de datos contra una varianza de referencia, 
                                          una desviación estándar de referencia, 
                                          o una desviación estándar relativa (coeficiente de variación) de referencia,
                                          haciendo uso de la prueba \\(\\chi^2\\). "),
                                  tags$li("La prueba F de Fisher permite comparar la homogeneidad de las varianzas de dos muestras 
                                          estadísticas."),
                                  tags$li("Para comparar la homogeneidad de varianzas entre más de dos muestras estadísticas
                                          están disponibles cuatro pruebas de inferencia estadística:", tags$br(),
                                          tags$ol(
                                            tags$li(tags$b('Prueba de Barlett:'), 'Calcula el estadístico ...'),
                                            tags$li(tags$b('Prueba de Levene:'), 'Calcula el estadístico ...'),
                                            tags$li(tags$b('Prueba de Hartley:'), 'Calcula el estadístico ...'),
                                            tags$li(tags$b('Prueba de Cochran:'), 'Calcula el estadístico ...')
                                          ))),
                                "la dispersión de una muestra estadística contra un valor de referenciahablar de los tres tipos más importantes"))
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

lyCompANOVADscrp <- infoBox(width = 12, "Comparación de medias de varios grupos muestrales", color = 'navy',
                         h4("La comparación de varioa medias muestrales evalua ..."))
lyCompANOVA <- fluidRow(column(6, box(title = tags$b('Análisis de varianza'), width = 12, status = 'primary',
                                      height = 400, comparacionANOVAUI('anovaMdl'))),
                    column(12, box(title = tags$b('Pruebas de detección de diferencias entre grupos'), width = 12, status = 'primary',
                                   height = 1080,
                                   comparacionRanMulUI('ranMulAov')),
                           box(title = NULL, status = 'primary', width = 12, 
                               tags$h5('Prueba de Duncan para rangos múltiples y prueba de Fisher para diferencia mínima 
                                       significativa implementadas en R por el paquete ', tags$b('agricolae'), 
                                       ' [Mendiburu, 2020]'))))

lyCompANCOVADscrp <- infoBox(width = 12, "Análisis de covarianza", color = 'navy',
                            h4("La comparación de ..."))
lyCompANCOVA <- fluidRow(column(6, box(title = tags$b('Analisis de covarianza '), width = 12, status = 'primary',
                                      height = 500, comparacionANCOVAUI('ancovaMdl'))))