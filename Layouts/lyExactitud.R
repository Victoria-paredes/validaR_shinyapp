lyExactitudDscrp <- infoBox(width = 12, "Descripción del parámetro de validación", color = 'light-blue',
                            "La exactitud... Comprende... Precisión... Exactitud...")

lyExactitud <- box(width = 12,
                   lyExactitudDscrp,
                   tabBox(width = 12, height = 800,
                      tabPanel('Precisión',
                               tabBox(width = 12, height = 800,
                                      tabPanel('Coeficiente de variación de Horwitz'), 
                                      mdlPrecisionHorRatUI(id = "HorRat1")
                                      )),
                      tabPanel('Sesgo')))

