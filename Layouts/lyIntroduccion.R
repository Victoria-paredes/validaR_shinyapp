introduccionLy <- fluidRow(
    column(12, 
      box(width = 12, status = 'primary', title = '',
        fluidRow(
          column(8,
            h4("Esta aplicación provee herramientas estadísticas de uso general con el 
                propósito de facilitar la validación de métodos químicos cuantitativos. 
                De manera general se incluyen las metodologías y los ejemplos descritos en la",
               tags$b("Guía de Validación de Métodos Cuantitativos del Instituto Nacional de Metrología de Colombia"),
               "(a la derecha).",
               tags$br(), tags$br(), tags$br(),
               "La aplicación se divide en un panel principal que ocupa la mayor parte de la página, y
                un panel lateral a la izquierda que se usa para seleccionar las opciones principales.
                Cada opción contiene instrucciones que deben ser tenidas en cuenta para el uso de la aplicación. 
                A continuación se listan algunos comentarios generales:", 
               tags$br(), tags$br(),
               HTML('&emsp;'), "• Inicialmente se deben ingresar los datos en la opción ", 
               icon("hockey-puck"), tags$b("Ingreso de datos"), " del panel lateral.",
               tags$br(), tags$br(),
               HTML('&emsp;'), "• Los datos de los ejemplos incluídos en la Guía de Validación están disponibles en la opción ", 
               icon("folder-open"), tags$b("Datos de ejemplos."),
               tags$br(), tags$br(),
               HTML('&emsp;'), "• Los gráficos que produce la aplicación pueden descargarse en formato PDF y PNG.", tags$br(),
               HTML('&emsp;&emsp;&nbsp;'), "El formato de los archivos y su tamaño deben seleccionarse en ",
               icon("cog"), tags$b("Configuración archivos descargables."),
               tags$br(), tags$br(),
               HTML('&emsp;'), "• Para guardar el estado de la aplicación en cualquier momento dado, 
               haga click en el botón", tags$br(),
               HTML('&emsp;&emsp;&nbsp;'), icon("link"), tags$b("Guardar..."), "copie y guarde el link que se genera, y úselo para
               acceder a la aplicación cuando desee continuar.",
               tags$br(), tags$br(),
               HTML('&emsp;'), "• Se recomienda el uso de pantallas con resolución mínima de 1920x1080 pixeles.", tags$br(),
               HTML('&emsp;&emsp;&nbsp;'), "Para pantallas con menor resolución puede ser necesario disminuír el tamaño de la página
               para visualizar correctamente", tags$br(),
               HTML('&emsp;&emsp;&nbsp;'), 
               "el contenido. Puede usarse como referencia la siguiente línea, la cual debe ocupar únicamente un renglón:", tags$br(),
               HTML('&emsp;&emsp;&nbsp;'), 
               ". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
               . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 
               . . . . . . . . . . . . . . . . . .")),
          column(4, div(img(src = "Guia_p1.png", width = 400), style = "text-align: center;"),
                 HTML('&emsp;&emsp;&emsp;&emsp;&emsp;'), 
                 a(href = "guia.pdf", "Descargar la guía de validación...", download = NA, target = "_blank"))))),
    column(3, 
      box(width = 12, height = 350, title = tags$b('Estadística descriptiva e inferencial'), status = 'primary', 
        h4('El módulo de estadística descriptiva proporciona descriptores estadísticos de tendencia central y de dispersión
           de las series de datos, realiza las pruebas estadísticas de Wilkinson y de Kolmogorov-Smirnof que tratan de 
           establecer si los datos bajo estudio se distribuyen de manera normal, y trata de identificar datos anómalos
           dentro de la serie por medio de las pruebas de Grubbs y de Dixon.', tags$br(), tags$br(),
           'En el módulo de pruebas de comparación están disponibles las pruebas de inferencia estadística para comparar 
           medias muestrales con valores de referencia o entre conjuntos de dos o más muestras...'))),
    column(3, 
      box(width = 12, height = 350, title = tags$b('Modelos de regresión'), status = 'primary', 
                         h4('(poner gráficos de regresiones plus una descripción suave)'))),
    column(6, 
      box(width = 12, height = 350, title = tags$b('Parámetros de validación'), status = 'primary', 
                         h4('(pensar que poner acá... tal vez una lista)'))),
    column(12, 
      box(title = NULL, status = 'primary', width = 12, 
        tags$h5('Esta página web corre gracias al programa de computación científica y de 
                 regresentaciones gráficas R [R Core Team, 2020]. La implementación en este 
                 tablero interactivo fue posible por medio de las librerías 
                 Shiny y Shinydashboard [Chang y otros., 2020].')))
)
