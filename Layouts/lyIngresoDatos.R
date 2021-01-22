lyIngresoDatDscrp <- infoBox(
  width = 8, "Instrucciones", color = 'navy', icon = icon("info-circle"),
  h5("Los datos experimentales deben ingresarse en forma de series independientes que pueden ser univariados 
      (como un conjunto de resultados de medición de una misma muestra o un grupo de muestras), o bivariados 
      (como una curva de calibración). En el caso de datos bivariados, es posible ingresar los errores asociados a cada 
      dato, para cada variable. Los conjuntos de datos que van a ser sometidos
      a pruebas de comparación de algún tipo deben ser ingresados en series independientes. Lo primero que deberá hacer 
      es seleccionar el número de series que quiere ingresar y el numero de filas por cada serie, utilizando los 
      deslizadores numéricos que se muestran a la derecha. Para que cambiar el número máximo de filas de las tablas es necesario
      que estas se encuentren llenas únicamente con ceros. Tenga en cuenta que puede dejar filas o columnas sin llenar (en  ceros), y 
      que la aplicación registra todas las cifras significativas que ingrese al sistema a pesar de nos mostrarlas todas en las 
      tablas.", 
      tags$br(), tags$br(),
      "El comportamiento de la tabla donde se ponen los valores es muy similar al que ofrecen las hojas de cálculo 
      tradicionales. Esto permite que los datos pueden ser copiados directamente estos recursos. Cuando haya llenado la tabla 
      haga click en el botón ", tags$b('Cargar datos.'), 'Se recomienda incluír una descripción del conjunto de datos
      en el espacio dispuesto para tal fin. Los módulos de ingreso de datos son colapsables para facilitar el llenado de
      las tablas.', tags$br(), tags$br()),
  h5("En la opción ", icon("folder-open"), tags$b("Datos de ejemplos"), "encontrará tablas con datos que puede usar 
      si desea aprender a manejar la aplicación pero aún no tiene datos propios."))

lyIngresoDatInstr <- infoBox(title = 'Instrucciones', icon = icon("question-circle"), width = 9, color = 'light-blue',
                             value = h4('Los datos que se ingresan a la aplicación pueden ser de cuatro naturalezas...'))

lyIngresoDat <- fluidRow(column(12, lyIngresoDatDscrp,
                                box(width = 4, 
                                    sliderInput('numDatSeriesManual', label = 'Número de series de datos a ingresar:', 
                                                min = 1, max = 20, value = 3, round = TRUE, width = '100%'),
                                    tags$hr(),
                                    sliderInput('nRows', label = 'Número de filas de datos por serie:', 
                                                min = 5, max = 100, value = 15, round = TRUE, width = '100%')
                                )),
                       column(12,
                         ingresarDatosUI(id = 'serieMan1'),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 2', 
                                          ingresarDatosUI(id = 'serieMan2', IntID = 2)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 3', 
                                          ingresarDatosUI(id = 'serieMan3', IntID = 3))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 4', 
                                          ingresarDatosUI(id = 'serieMan4', IntID = 4)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 5', 
                                          ingresarDatosUI(id = 'serieMan5', IntID = 5)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 6', 
                                          ingresarDatosUI(id = 'serieMan6', IntID = 6))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 7', 
                                          ingresarDatosUI(id = 'serieMan7', IntID = 7)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 8', 
                                          ingresarDatosUI(id = 'serieMan8', IntID = 8)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 9', 
                                          ingresarDatosUI(id = 'serieMan9', IntID = 9))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 10', 
                                          ingresarDatosUI(id = 'serieMan10', IntID = 10)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 11', 
                                          ingresarDatosUI(id = 'serieMan11', IntID = 11)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 12', 
                                          ingresarDatosUI(id = 'serieMan12', IntID = 12))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 13', 
                                          ingresarDatosUI(id = 'serieMan13', IntID = 13)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 14', 
                                          ingresarDatosUI(id = 'serieMan14', IntID = 14)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 15', 
                                          ingresarDatosUI(id = 'serieMan15', IntID = 15))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 16', 
                                          ingresarDatosUI(id = 'serieMan16', IntID = 16)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 17', 
                                          ingresarDatosUI(id = 'serieMan17', IntID = 17)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 18', 
                                          ingresarDatosUI(id = 'serieMan18', IntID = 18))),
                       column(12,
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 19', 
                                          ingresarDatosUI(id = 'serieMan19', IntID = 19)),
                         conditionalPanel(condition = 'input.numDatSeriesManual >= 20', 
                                          ingresarDatosUI(id = 'serieMan20', IntID = 20))))
                      
#                      box(width = 6, height = 800, title = 'Importación de series de datos (PENDIENTE)', solidHeader = TRUE, 
#                          status = 'primary',
#                          sliderInput('numDatSeriesImport', label = 'Número de series de datos a importar:', 
#                                      min = 0, max = 50, value = 0, round = TRUE, width = '50%'),
#                          importarDatosUI(id = 'serieImp1')
#                          )
#                      ))

# Poner boton de agregar filas