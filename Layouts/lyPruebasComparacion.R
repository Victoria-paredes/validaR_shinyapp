#lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramientas de estadística inferencial", color = 'light-blue',
#                           "Las pruebas de comparación...")
#lyPruebasComparacion <- box(width = 12,
#                            lyPruebasComparacionDscrp)


lyCompMediasDscrp <- infoBox(width = 12, "Pruebas de comparación de medias", color = 'light-blue',
                             h4("hablar de los tres tipos más importantes... "),
                             h5("Se recomienda que los datos seleccionados sean de naturaleza univariada. 
                                En conjuntos de datos de otro tipo de naturaleza solo se tiene en cuenta la primera columna."))
lyCompMedias <- fluidRow(column(6, box(title = tags$b('Media muestral contra un valor de referencia (prueba t)'),
                                       width = 12, status = 'primary',
                                       solidHeader = TRUE, height = 500, comparacionMediasUI_1('mediaVsReferencia'))),
                         column(6, box(title = tags$b('Una media muestral contra otra media muestral(prueba t)'), 
                                       width = 12, status = 'primary',
                                       height = 500, comparacionMediasUI_2('dosMedias'))), tags$br(), 
                         column(12, box(title = NULL, width = 12, status = 'primary',
                                h4('Para  comparar las medias de varios grupos muestrales por favor diríjase a la sección de 
                                   análisis de varianza (ANOVA).'))))

lyCompVarianDscrp <- infoBox(width = 12, "Pruebas de comparación de varianza", color = 'light-blue',
                             h4("hablar de los tres tipos más importantes"))
lyCompVarian <- fluidRow(column(6, box(title = tags$b('Varianza muestral contra un valor de referencia (prueba \\(\\chi^2\\))'), 
                                       solidHeader = TRUE, width = 12, status = 'primary',
                                       height = 570, comparacionVarianUI_1('varianVsReferencia'))),
                         column(6, box(title = tags$b('Una varianza muestral contra otra varianza muestral (Prueba F)'), 
                                       width = 12, status = 'primary',
                                       solidHeader = TRUE, height = 570, comparacionVarianUI_2('dosVarian'))),
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

lyCompANOVADscrp <- infoBox(width = 12, "Comparación de medias de varios grupos muestrales", color = 'light-blue',
                         h4("La comparación de varioa medias muestrales evalua ..."))
lyCompANOVA <- fluidRow(column(8, box(title = tags$b('Análisis de varianza'), width = 12, status = 'primary',
                                      height = 400, comparacionANOVAUI('anovaMdl'))),
                    column(12, box(title = tags$b('Pruebas de detección de diferencias entre grupos'), width = 12, status = 'primary',
                                   height = 1080, 
                                   comparacionRanMulUI('ranMulAov')),
                           box(title = NULL, status = 'primary', width = 12, 
                               tags$h5('Prueba de Duncan para rangos múltiples y prueba de Fisher para diferencia mínima 
                                       significativa implementadas en R por el paquete ', tags$b('agricolae'), 
                                       ' [Mendiburu, 2020]'))))

lyCompANCOVADscrp <- infoBox(width = 12, "Análisis de covarianza", color = 'light-blue',
                            h4("La comparación de ..."))
lyCompANCOVA <- fluidRow(column(6, box(title = tags$b('Analisis de covarianza '), width = 12, status = 'primary',
                                      height = 500, comparacionANCOVAUI('ancovaMdl'))))