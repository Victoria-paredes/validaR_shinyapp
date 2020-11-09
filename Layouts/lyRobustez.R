lyRobustezDscrp <- infoBox(width = 12, "Diseño y análisis de de los experimentos de robustez", color = 'light-blue',
                           h4("hablar de los diseños experimentales fraccionales regulares, Placket-Burman"),
                           h5("pendiente...."))
lyRobustez <- fluidRow(column(12, robustezUI('robustez'),
                             box(title = NULL, status = 'primary', width = 12, 
                                 tags$h5('Diseños de experimentos implementados en R por el paquete ', 
                                         tags$b('FrF2'), ' [Grömping, 2014].'))))
