datosEjemploUI <- function(id) {
  ns <- NS(id)
  
    column(12, 
      infoBox(width = 12, "Banco de datos de ejemplos", color = 'light-blue', icon = icon('info-circle'),
        h4("Los datos en las siguientes tablas pueden ser copiadas en el módulo de ingreso de datos
           para ejemplificar el uso de las funciones de la aplicación.")),
      tabBox(width = 12, title = tags$b('Herramientas estadísticas'), side = 'left', height = 1200,
             tabPanel(title = tags$b('Análisis de regresión'),
                      box(title = 'Curva de calibración', status = 'warning', width = 3, height = 800,
                          tags$html(tags$h5('La siguiente tabla contiene datos de una curva de calibración de ión litio 
                                             por espectrometría de emisión atómica de llama.',
                                  tags$br(),'Esta serie de datos puede usarse para ejemplificar el uso de las regresiones 
                                  lineales por mínimos cuadrados ordinarios y por mínimos cuadrados ortogonales:')),
                          tableOutput(ns('OLSTab'))#, tags$h6('Los datos fueron obtenidos de .')
                      ),
                      box(title = 'Curva de calibración ponderada', status = 'warning', width = 3, height = 800,
                          tags$html(tags$h5('La siguiente tabla contiene datos de ... ',
                                            tags$br(),'Esta serie de datos puede usarse para ejemplificar el uso de la regresión
                                  lineal por mínimos cuadrados ponderados:')),
                          tableOutput(ns('WLSTab'))#, tags$h6('Los datos fueron obtenidos de .')
                      ),
                      box(title = 'Comparación entre dos métodos (Con incertidumbres)', status = 'warning', width = 3, height = 800,
                          tags$html(tags$h5('La siguiente tabla contiene los resultados (en ', HTML('&mu;g L'), tags$sup(-1), 
                                  ') de la determinación de 
                                  Arsenato(V) en ríos naturales, utilizando espectrometría de absorción atómica (AAS) y 
                                  espectrometría de emisión atómica [Ripley y Thompsom, 1987]. Los valores experimentales 
                                  tienen error conocido para ambas variables porque son resultados de mediciones. 
                                  Este conjunto de datos puede usarse para ejemplificar el uso de la regresión por mínimos
                                  cuadrados generalizados.:')),
                          tableOutput(ns('arsenateFrac'))#, tags$h6('Los datos fueron obtenidos de .')
                      ),
                      box(title = 'Regresión no paramétrica (Passing-Bablock)', status = 'warning', width = 3, height = 800,
                          tags$h5('La siguiente tabla contiene una fracción de los resultados de un ensayo clínico en el que 
                                  se determinó la concentración de ferritina en la sangre de distintos pacientes usando reactivos 
                                  de dos lotes distintos [Therneau, 2018].', tags$b(), 'En la serie de datos hay anómalos 
                                  por lo que el conjunto puede usarse para ejemplificar las regresiones lineales no paramétricas:'),
                          tableOutput(ns('NonParRegTab'))#, tags$h6('Los datos fueron obtenidos de .')
                      )),
             
             tabPanel(title = tags$b('Comparación de medias y varianzas muestrales'),
                      box(title = NULL, width = 12, 
                          tags$h4('Los siguientes conjuntos de datos pueden ser utilizados para la comparación de medias y varianzas,
                                  contra un valor de referencia, entre dos grupos muestrales, y entre varios grupos muestrales.')),
                      box(title = 'Comparación contra valor de referencia', status = 'warning', width = 2, height = 500,
                          tags$h5('La siguiente tabla contiene resultados individuales (en mg/kg) de la determinación
                                  de un elemento tóxico en un producto alimenticio:'),
                          tableOutput(ns('media1Tab')),
                          tags$h6('El valor de referencia para la media es de 500 mg/kg y corresponde al valor máximo permitido 
                                  por la regulación para el elemento en cuestión, en la matriz considerada. 
                                  Para comparar la varianza de la muestra ')),
                      box(title = 'Dos medias muestrales', status = 'primary', width = 3, height = 500,
                          tags$h6('Las siguientes tablas contienen los resultados reportados por dos analistas diferentes para 
                                  una misma muestra: (PENDIENTE)'),
                          fluidRow(column(6, tableOutput(ns('medias2Tab1'))), column(6, tableOutput(ns('medias2Tab2'))))),
                      box(title = 'Varias medias muestrales (ANOVA)', status = 'primary', width = 7, height = 500,
                          tags$h6('Las siguientes tablas contienen : (PENDIENTE)'),
                          fluidRow(column(2, tableOutput(ns('mediasMulTab1'))), 
                                   column(2, tableOutput(ns('mediasMulTab2'))), 
                                   column(2, tableOutput(ns('mediasMulTab3'))), 
                                   column(2, tableOutput(ns('mediasMulTab4'))), 
                                   column(2, tableOutput(ns('mediasMulTab5'))), 
                                   column(2, tableOutput(ns('mediasMulTab6')))))),
             
             tabPanel(title = tags$b('Análisis de covarianza (ANCOVA)'),
                      tableOutput(ns('ancovaTab')))
             ),
      tabBox(width = 12, title = tags$b('Parámetros de validación'), side = 'left', height = 500, 
             tabPanel(title = 'Selectividad', 'Los siguientes datos corresponden',
                      tableOutput(ns('selTab'))),
             tabPanel(title = 'Exactitud', 'Ss',
                      tableOutput(ns('exacTab'))),
             tabPanel(title = 'Linealidad', 'Ss',
                      tableOutput(ns('lineTab'))),
             tabPanel(title = 'Límite de detección', 'Ss',
                      tableOutput(ns('lodTab'))),
             tabPanel(title = 'Robustex', 'Ss',
                      tableOutput(ns('robusTab')))
      )
    )
}

datosEjemploServer <- function(input, output, session) {
  output$OLSTab <- renderTable({df <- transmem::curvelithium
                                df$Conc <- round(df$Conc, 2)
                                colnames(df) <- c('Conc (mg/kg)', 'Señal')
                                return(df)}, digits = 3)
  output$WLSTab <- renderTable(data.frame('Serie_1' = rep(0, 9)), digits = 2)
  output$NonParRegTab <- renderTable({
    set.seed(47); df <- deming::ferritin2[sample(162, 15), 3:4]; colnames(df) <- c('Lote1', 'Lote2')
    return(df)
    })
  output$arsenateFrac <- renderTable({
    set.seed(1); df <- deming::arsenate[sample(30, 15), c(1, 3, 2, 4)]; colnames(df) <- c('AAS', 'AES', 'u_AAS', 'u_AES')
    return(df)
  })
  
  output$media1Tab <- renderTable(data.frame('Elemento_tox' = c(527, 504, 447, 426, 437, 479, 470, 505)), digits = 0)
  output$medias2Tab1 <- renderTable(data.frame('Analista_A' = rep(0, 9)), digits = 2)
  output$medias2Tab2 <- renderTable(data.frame('Analista_B' = rep(0, 9)), digits = 2)
  output$mediasMulTab1 <- renderTable(data.frame('Serie_1' = rep(0, 9)), digits = 2)
  output$mediasMulTab2 <- renderTable(data.frame('Serie_2' = rep(0, 9)), digits = 2)
  output$mediasMulTab3 <- renderTable(data.frame('Serie_3' = rep(0, 9)), digits = 2)
  output$mediasMulTab4 <- renderTable(data.frame('Serie_4' = rep(0, 9)), digits = 2)
  output$mediasMulTab5 <- renderTable(data.frame('Serie_5' = rep(0, 9)), digits = 2)
  output$mediasMulTab6 <- renderTable(data.frame('Serie_6' = rep(0, 9)), digits = 2)
}

#i <- 47; plot(deming::ferritin2[sample(162, 15), 3:4], main = i)
