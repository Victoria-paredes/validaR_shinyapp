lySelectivDscrp <- infoBox(width = 12, "Descripción del parámetro de validación", color = 'light-blue',
                            "La selectividad...")

lySelectiv <- box(width = 12,
                  lySelectivDscrp,
                   tabBox(width = 12, height = 800,
                          tabPanel('Interferentes individuales',
                                  sliderInput(inputId = "SlctIndIntrfrntsNmbr", label = "Número de interferentes individuales", 
                                              min = 1, max = 20, value = 2, step = 1)),
                          tabPanel('Interferentes simultáneos')))