lyRegresionDscrp <- infoBox(width = 12, "Modelos de regresión lineal", color = 'light-blue',
                            h4("hablar de los algoritmos implementados... "),
                            h5("Hablar de la forma que tienen que tener los datos en cada caso."))
lyRegresion <- fluidRow(column(12, regresionUI('regModel1'),
                               box(title = NULL, status = 'primary', width = 12, 
                                   tags$h5('Modelos de regresión ODR y GLS implementados en R por el paquete ', 
                                           tags$b('deming'), ' [Therneau, 2018].'))))
