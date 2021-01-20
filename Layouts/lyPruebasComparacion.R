#lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramientas de estadística inferencial", color = 'light-blue',
#                           "Las pruebas de comparación...")
#lyPruebasComparacion <- box(width = 12,
#                            lyPruebasComparacionDscrp)

lyCompMediasDscrp <- infoBox(width = 12, "Instrucciones", color = 'navy',
                             h5("Este módulo permite comparar una media muestral contra un valor de referencia o contra
                                otra media muestral. Para el caso de dos medias muestrales, los datos de las muestras estadísticas 
                                pueden ser independientes o puede tratarse de datos emparejados.", tags$br(),
                                "Los conjuntos de datos a analizar deben ser de naturaleza univariada. 
                                Si la serie de datos contiene varias 
                                columnas activas, la aplicación solo tiene en cuenta la primera de estas.", tags$br(),
                                tags$ul(
                                  tags$li('Comparar una media muestral contra un valor de referencia requiere un conjunto de datos,
                                          el valor de referencia, una hipótesis alternativa y un nivel de confianza para la prueba.
                                          El valor de referencia debe estar en las mismas unidades que los valores del conjunto de 
                                          datos que  compone la muestra estadística.'),
                                  tags$li('Para comparar dos muestras estadísticas es necesario escoger los conjuntos de datos,
                                          una hipótesis alternativa y un nivel de confianza. Las muestras pueden ser independientes 
                                          o pueden estar emparejadas, en cuyo caso debe activarse la opción de muestras emparejadas
                                          antes de correr el análisis.
                                          Si las muestras estadísticas son independientes, la aplicación automáticamente verifica 
                                          si las varianzas muestrales son homogéneas o no, para calcular el estadístico', tags$b('t'), 
                                          'que corresponda según el caso.'),
                                  #tags$li(''),
                                  tags$li('Para  comparar las medias de más de dos grupos muestrales por favor diríjase a la 
                                          sección', tags$b('Análisis de varianza (ANOVA).')))))
lyCompMedias <- fluidRow(column(6, box(title = tags$b('Media muestral contra un valor de referencia (prueba t)'),
                                       width = 12, status = 'primary',
                                       height = 700, comparacionMediasUI_1('mediaVsReferencia'))),
                         column(6, box(title = tags$b('Media muestral contra otra media muestral (prueba t)'), 
                                       width = 12, status = 'primary',
                                       height = 700, comparacionMediasUI_2('dosMedias'))), tags$br())

lyCompVarianDscrp <- infoBox(width = 12, "Instrucciones", color = 'navy',
                             h5("hablar de los tres tipos más importantes"))
lyCompVarian <- fluidRow(column(6, box(title = tags$b('Varianza muestral contra un valor de referencia (prueba \\(\\chi^2\\))'), 
                                       solidHeader = FALSE, width = 12, status = 'primary',
                                       height = 570, comparacionVarianUI_1('varianVsReferencia'))),
                         column(6, box(title = tags$b('Varianza muestral contra otra varianza muestral (Prueba F)'), 
                                       width = 12, status = 'primary',
                                       solidHeader = FALSE, height = 570, comparacionVarianUI_2('dosVarian'))),
                         column(12, box(title = tags$b('Comparación de varianzas muestrales de más de dos conjuntos de datos'), 
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