datosEjemploUI <- function(id) {
  ns <- NS(id)
  
    column(12, 
      infoBox(title = NULL, color = 'light-blue', width = 12, icon = icon('info-circle'),
              tags$h4('... ... pueden ser copiados y pegados directamente en la sección de ingreso de datos... ...')),
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
             ),
      tabBox(width = 12, title = tags$b('Pruebas de comparación'), side = 'left', height = 600,
             tabPanel(title = tags$b('Medias muestrales (incluye ANOVA)'),
                      box(title = 'Media muestral contra valor de referencia', status = 'warning', width = 2, height = 500,
                          tags$h5('La siguiente tabla contiene resultados individuales (en mg/kg) de la determinación
                                  de un elemento tóxico en un producto alimenticio:'),
                          tableOutput(ns('media1Tab')),
                          tags$h6('El valor de referencia en este ejemplo es de 500 mg/kg y corresponde al valor máximo permitido 
                                  por la regulación para el elemento en cuestión en la matriz considerada.')),
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
             tabPanel(title = tags$b('Varianzas muestrales'),
                      tableOutput(ns('varianzasTab'))),
             tabPanel(title = tags$b('Análisis de covarianza ANCOVA'),
                      tableOutput(ns('ancovaTab')))
             )
    )
}

datosEjemploServer <- function(input, output, session) {
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