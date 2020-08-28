lyPruebasComparacionDscrp <- infoBox(width = 12, "Herramienta de estadística inferencial", color = 'light-blue',
                           "Las pruebas de comparación...")

lyPruebasComparacion <- box(width = 12,
                            lyPruebasComparacionDscrp,
                            tabPanel('Normalidad'),
                            tabPanel('Autocorrelación del error'),
                            tabPanel('Homocedasticidad'),
                            tabPanel('Comparación de medias',
                                     tabBox(width = 12, height = 800,
                                            tabPanel('Pruebas t'),
                                            tabPanel('Pruebas chi2'),
                                            tabPanel('ANOVA'),
                                            tabPanel('Contra un control'))))
