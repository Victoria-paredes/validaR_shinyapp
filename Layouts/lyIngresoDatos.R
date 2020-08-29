lyIngresoDatDscrp <- infoBox(width = 12, "Ingreso de datos a la aplicación", color = 'light-blue',
                            "Los datos experimentales pueden ingresarse a la plataforma de manera manual o pueden
                            importarse desde un archivo .csv. En el ingreso manual de datos el comportamiento es muy similar
                            al que ofrecen las hojas de cálculo comunes por lo que los datos pueden ser copiados directamente 
                            desde tales recursos... Comprende... Precisión... Exactitud...")

lyIngresoDat <- box(width = 12,
                    lyIngresoDatDscrp, tags$br(), tags$hr(), tags$br(),
                    fluidRow(
                      box(width = 6, title = 'Ingreso manual de series de datos', solidHeader = TRUE, status = 'primary',
                          sliderInput('numDatSeriesManual', label = 'Número de series de datos a ingresar manualmente:', 
                                      min = 0, max = 20, value = 2, round = TRUE, width = '50%'),
                          ingresarDatosUI(id = 'serieMan1'),
                          conditionalPanel(condition = 'input.numDatSeriesManual >= 2', 
                                           ingresarDatosUI(id = 'serieMan2', IntID = 2))),
                      
                      box(width = 6, height = 800, title = 'Importación de series de datos (PENDIENTE)', solidHeader = TRUE, 
                          status = 'primary',
                          sliderInput('numDatSeriesImport', label = 'Número de series de datos a importar:', 
                                      min = 0, max = 50, value = 0, round = TRUE, width = '50%'),
                          importarDatosUI(id = 'serieImp1')
                          )
                      ))

# Poner boton de agregar filas