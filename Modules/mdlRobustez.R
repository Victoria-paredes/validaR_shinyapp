robustezUI <- function(id) {
  ns <- NS(id)
  column(12, 
         tabBox(width = 12, title = tags$b(''), side = 'left', height = 500,
                tabPanel(title = 'Diseño de la matriz de experimentos',
                         sliderInput(ns('dc'), label = 'Número de variables', min = 1, max = 20, value = 4),
                         checkboxGroupInput(ns('ConfFrF'), label = '', 
                                            choices = list('Personalizar nombres y valores' = 1)),
                         actionButton(ns('crearMatriz'), label = 'Crear matriz', styleclass = 'primary')),
                tabPanel(title = 'Análisis de la matriz de experimentos', 'Los siguientes datos corresponden',
                         sliderInput(ns('dc'), label = 'Número de variables', min = 1, max = 20, value = 4)))
  )
}


robustezServer <- function(input, output, session) {
  
}

