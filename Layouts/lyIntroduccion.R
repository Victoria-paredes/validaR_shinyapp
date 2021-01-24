introduccionLy <- fluidRow(
    column(12, 
      box(width = 12, status = 'primary',
        fluidRow(
          column(8,
            h4("Esta aplicación implementa los procedimientos estadísticos que se mencionan en la",
               tags$b("Guía de Validación de Métodos Cuantitativos del Instituto Nacional de Metrología de Colombia"),
               "(en proceso de elaboración).
                La aplicación ", tags$b("validaR"), " provee herramientas generales de estadística descriptiva, 
                estadística inferencial 
                (pruebas de comparación), análisis de regresión, cálculo de parámetros de validación, 
                entre otras funciones, que serán de utilidad para todo aquel que tenga que ver con la validación
                de métodos analíticos cuantitativos. El propósito de ", tags$b("validaR"), " es apoyar en el tratamiento de
                datos experimentales de validación con el fin de que las personas puedan enfocarse en la parte importante del proceso: 
                documentar los resultados, obtener las conclusiones, y escoger rutas de acción cuando estas sean necesarias.",
               tags$br(),
               # "Los ejemplos expuestos en la guía de validación se desarrollaron en esta aplicación. Los 
               #  datos de los ejemplos que se incluyen en la guía aparecenpara que, entre otras cosas, el usuario 
               # final se damiliarice con las
               #  funciones de la aplicación.",
               tags$br(), #tags$br(), tags$br(),
               "La aplicación se divide en un panel principal que ocupa la mayor parte de la página, y
                un panel lateral a la izquierda que se usa para navegar entre las distintas secciones de la aplicación.
                Cada opción contiene instrucciones para el uso de las funciones disponibles. ", 
               tags$br(), tags$br(),
               tags$ul(
                 tags$li("Para iniciar se deben ingresar los datos en la opción ", 
                         icon("hockey-puck"), tags$b("Ingreso de datos"), " del panel lateral. "), tags$br(),
                 tags$li("Los datos de los ejemplos incluídos en la Guía de Validación están disponibles en la opción ", 
                         icon("folder-open"), tags$b("Datos de ejemplos.")), tags$br(),
                 tags$li("Los gráficos que produce la aplicación pueden descargarse en formato PDF o PNG.
                         El formato de los archivos y su tamaño se configuran en la sección",
                         icon("cog"), tags$b("Configuración archivos."), 
                         "Algunas opciones de los gráficos pueden personalizarse haciendo seleccionando el botón 
                         circular rojo que se encuentra cerca de cada gráfico."), tags$br(),
                 tags$li("Para guardar el estado de la aplicación en cualquier momento dado, haga click en el botón", 
                         icon("link"), tags$b("Guardar..."), "copie y guarde el link que se genera.
                         Use dicho link para acceder a la aplicación cuando desee continuar.", 
                         tags$code("(Esta función aún no se encuentra disponible)")), tags$br(),
                 tags$li("Se recomienda el uso de pantallas con resolución igual o superior a 1920x1080 pixeles.
                         Para pantallas con menor resolución puede ser necesario disminuír el tamaño de la página 
                         para visualizar correctamente todo el contenido.", tags$br(), "Como referencia puede usarse 
                         la siguiente línea punteada que debe ocupar únicamente un renglón:", tags$br(),
                         ". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
                          . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .")))),
          column(4, div(img(src = "guia.png", width = 400), style = "text-align: center;"),
                 HTML('&emsp;&emsp;&emsp;&emsp;&emsp;'), 
                 a(href = "guia.pdf", "Descargar la guía de validación...", download = NA, target = "_blank"))))),
    column(12, 
      box(width = 4, title = tags$b('Estadística descriptiva e inferencial'), status = 'primary', #height = 400,
          collapsible = TRUE, collapsed = TRUE,
        h4('El módulo de estadística descriptiva genera estadísticos de tendencia central y de dispersión
           de las series de datos; realiza las pruebas estadísticas de Wilkinson y de Kolmogorov-Smirnof para
           establecer si los datos bajo estudio se distribuyen de manera normal; y trata de identificar datos anómalos
           dentro de la serie por medio de las pruebas de Grubbs y de Dixon.', tags$br(), tags$br(),
           'Por otro lado, en el módulo de pruebas de comparación están disponibles distintas pruebas de inferencia 
            estadística para comparar 
           medias y varianzas muestrales con valores de referencia, o entre sí. Está también disponible 
          la prueba de análisis de varianza
           (ANOVA) incluyendo las pruebas post hoc de Fisher, Tukey, y Duncan.', tags$br(), tags$br(),
           'Finalmente, está disponible un módulo de análisis de covarianza (ANCOVA), de mucha utilidad
            para evaluar diferencias entre grupos que poseen una covarianza en común (como el tiempo).')),
    #column(3, 
      box(width = 3, title = tags$b('Modelos de regresión'), status = 'primary',  #height = 400,
          collapsible = TRUE, collapsed = TRUE,
        h4('La aplicación permite el cálculo de distintos modelos de regresión para datos bivariados:', tags$br(),
           tags$ul(
             tags$li("Mínimos cuadrados ordinarios"),
             tags$li("Mínimos cuadrados ponderados"),
             tags$li("Mínimos cuadrados ortogonales"),
             tags$li("Mínimos cuadrados generalizados"),
             tags$li("Regresión no paramétrica"), tags$br()),
           "Algunos de estos modelos permiten especificar el error asociado a los puntos experimentales en uno o dos de los
           ejes, para ser considerados en el cálculo de los parámetros de regresión. La aplicación genera el grafico de la regresión
           con el intervalo de confianza, el gráfico de residuales, y los parámetros de la regresión con su error estándar
           asociado.")),
    #column(5, 
      box(width = 5, title = tags$b('Parámetros de validación'), status = 'primary', # height = 400,
          collapsible = TRUE, collapsed = TRUE,
        h4('El objetivo principal de la aplicación es el de proveer herramientas que faciliten los cálculos que son necesarios en la 
           validación de un método químico cuantitativo. La aplicación permite el cálculo de algunos parámetros de validación 
           y de algunos valores que pueden resultar de interés en la validación de un método analítico'))),
    column(12, 
      box(title = NULL, status = 'primary', width = 12, 
        tags$h5('Esta página web corre gracias al programa de computación científica y de 
                 regresentaciones gráficas R [R Core Team, 2020].', tags$br(), 'La implementación en este 
                 tablero interactivo fue posible por medio de las librerías 
                 Shiny y Shinydashboard [Chang y otros., 2020].', tags$br(), 'La mayoría de las representaciones gráficas
                 son creadas por medio del paquete ggplot2 [Wickham, 2016]')))
)
