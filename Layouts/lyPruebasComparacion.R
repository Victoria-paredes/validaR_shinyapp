#lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramientas de estadística inferencial", color = 'light-blue',
#                           "Las pruebas de comparación...")
#lyPruebasComparacion <- box(width = 12,
#                            lyPruebasComparacionDscrp)


lyCompMediasDscrp <- infoBox(width = 12, "Pruebas de comparación de medias", color = 'light-blue',
                                     "hablar de los tres tipos más importantes")
lyCompMedias <- tabBox(width = 12,
                       tabPanel(title = 'Una media muestral contra un valor de referencia', 
                                #h3('Comparación de una media muestral contra un valor de referencia'), 
                                comparacionMediasUI_1('mediaVsReferencia')),
                       tabPanel(title = 'Dos medias muestrales independientes', 
                                #h3('Comparación de medias de dos muestras independientes'),
                                comparacionMediasUI_2i('dosMerdias')),
                       tabPanel(title = 'Dos medias de muestras emparejadas', 
                                #h3('Comparación de medias de dos muestras emparejadas'),
                                comparacionMediasUI_2i('dosMerdiasPareadas')))
