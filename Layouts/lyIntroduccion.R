lyIntroduccionDscrp <- infoBox(width = 12, title = NULL, color = 'light-blue', icon = icon("align-justify"),
                               h4("La presente aplicación recopila e implementa las metodologías descritas en la 
                                  Guía de Validación de Métodos Cuantitativos del Instituto Nacional de Metrologóa de Colombia. 
                                  donde ...", tags$br(), tags$br(),
                                  "Haciendo uso de este aplicativo...", tags$hr()),
                               h5("Esta página web corre gracias al poderoso programa de computación científica y de 
                                  regresentaciones gráficas R [R Core Team, 2020]. La implementación en este tablero interactivo
                                  ha sido posible principalmente al paquete de R Shiny [Chang y otros., 2020]."))

lyIntroduccion <- fluidRow(column(width = 3, box(width = 12, title = 'Estadística descriptiva e inferencial', status = 'primary', 
                                                 h4('(poner gráficos de histogramas con curvas de densidad o algo así
                                                    plus una descripción suave)'))),
                           column(width = 3, box(width = 12, title = 'Modelos de regresión', status = 'primary', 
                                                 h4('(poner gráficos de regresiones plus una descripción suave)'))),
                           column(width = 6, box(width = 12, title = 'Parámetros de validación', status = 'primary', 
                                                 h4('(pensar que poner acá)')))                      
                      ) 