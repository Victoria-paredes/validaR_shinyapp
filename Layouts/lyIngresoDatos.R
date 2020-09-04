lyIngresoDatDscrp <- infoBox(width = 12, "Instrucciones", color = 'light-blue', icon = icon("info-circle"),
                            h4("Los datos experimentales pueden ingresarse a ... el comportamiento es muy similar
                               al que ofrecen las hojas de cálculo comunes por lo que los datos pueden ser copiados directamente 
                               desde tales recursos... tipos de datos..."))

lyIngresoDatInstr <- infoBox(title = 'Instrucciones', icon = icon("question-circle"), width = 9, color = 'light-blue',
                             value = h4('Los datos que se ingresan a la aplicación pueden ser de cuatro naturalezas...'))

lyIngresoDat <- fluidRow(column(12, box(width = 12, 
                                        box(width = 3, 
                                            sliderInput('numDatSeriesManual', label = 'Número de series de datos a ingresar:', 
                                                        min = 1, max = 20, value = 2, round = TRUE, width = '100%'))#,
                                        #lyIngresoDatInstr
                                        )),
                         ingresarDatosUI(id = 'serieMan1'),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 2', 
                                          ingresarDatosUI(id = 'serieMan2', IntID = 2)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 3', 
                                          ingresarDatosUI(id = 'serieMan3', IntID = 3)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 4', 
                                          ingresarDatosUI(id = 'serieMan4', IntID = 4)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 5', 
                                          ingresarDatosUI(id = 'serieMan5', IntID = 5)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 6', 
                                          ingresarDatosUI(id = 'serieMan6', IntID = 6)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 7', 
                                          ingresarDatosUI(id = 'serieMan7', IntID = 7)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 8', 
                                          ingresarDatosUI(id = 'serieMan8', IntID = 8)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 9', 
                                          ingresarDatosUI(id = 'serieMan9', IntID = 9)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 10', 
                                          ingresarDatosUI(id = 'serieMan10', IntID = 10)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 11', 
                                          ingresarDatosUI(id = 'serieMan11', IntID = 11)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 12', 
                                          ingresarDatosUI(id = 'serieMan12', IntID = 12)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 13', 
                                          ingresarDatosUI(id = 'serieMan13', IntID = 13)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 14', 
                                          ingresarDatosUI(id = 'serieMan14', IntID = 14)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 15', 
                                          ingresarDatosUI(id = 'serieMan15', IntID = 15)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 16', 
                                          ingresarDatosUI(id = 'serieMan16', IntID = 16)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 17', 
                                          ingresarDatosUI(id = 'serieMan17', IntID = 17)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 18', 
                                          ingresarDatosUI(id = 'serieMan18', IntID = 18)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 19', 
                                          ingresarDatosUI(id = 'serieMan19', IntID = 19)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 20', 
                                          ingresarDatosUI(id = 'serieMan20', IntID = 20)))
                      
#                      box(width = 6, height = 800, title = 'Importación de series de datos (PENDIENTE)', solidHeader = TRUE, 
#                          status = 'primary',
#                          sliderInput('numDatSeriesImport', label = 'Número de series de datos a importar:', 
#                                      min = 0, max = 50, value = 0, round = TRUE, width = '50%'),
#                          importarDatosUI(id = 'serieImp1')
#                          )
#                      ))

# Poner boton de agregar filas