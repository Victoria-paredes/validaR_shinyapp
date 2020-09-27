convertMenuItem <- function(mi, tabName) {
  mi$children[[1]]$attribs['data-toggle'] = "tab"
  mi$children[[1]]$attribs['data-value']  = tabName
  mi
}

customSidebar <- dashboardSidebar(tags$style(".left-side, .main-sidebar {padding-top: 110px;}"), # font-size: larger
                     width = 300, withMathJax(),
                     bookmarkButton(label = 'Guardar...', 
                                    title = 'Genera una dirección URL que guarda la información 
                                            ingresada en la applicación para posterior uso.'),
                     sidebarMenu(id = "tabs",
                       menuItem("Introducción", tabName = "introd", icon = icon("info-circle")),
                       menuItem("Definiciones", tabName = "defini", icon = icon("book")),
                       menuItem("Configuración archivos descargables", tabName = "config", icon = icon("cog")), tags$hr(),
                       tags$b('Datos experimentales:'),
                       menuItem("Ingreso de datos", tabName = "ingrManDat", icon = icon("hockey-puck")),
                       menuItem("Banco de datos de ejemplos", tabName = "ejemData", icon = icon("folder-open")), tags$hr(),
                       tags$b('Herramientas estadísticas:'),
                       menuItem("Estadística descriptiva", tabName = "estDescri", icon = icon("poll")),
                       menuItem("Pruebas de comparación", tabName = "estPruebas", icon = icon("greater-than-equal"),
                                menuSubItem("Comparación de medias", tabName = "PrCmp_Med"),
                                menuSubItem("Comparación de varianzas", tabName = "PrCmp_Var"),
                                menuSubItem("Analisis de varianza (ANOVA)", tabName = "PrCmp_anova"),
                                menuSubItem("Analisis de covarianza (ANCOVA)", tabName = "PrCmp_ancova")),
                       menuItem("Regresiones", tabName = "estRegr", icon = icon("signal")), tags$hr(),
                       tags$b('Parámetros de validación:'),
                       menuItem("Selectividad", tabName = "select", icon = icon("vials")),
                       menuItem("Exactitud (Precisión, veracidad)", tabName = "exacti", icon = icon("flask")),
                       menuItem("Linealidad, intervalo dinámico", tabName = "lineali", icon = icon("ruler-combined")),
                       menuItem("Límite de detección", tabName = "limDetec", icon = icon("bong")),
                       menuItem("Robustez", tabName = "robust", icon = icon("teeth")), tags$hr(),
                       tags$b('Recursos adicionales:'),
                       menuItem("Plan de validación", tabName = "planVali", icon = icon("tasks")),
                       menuItem("Informe de validación", tabName = "infVali", icon = icon("file-archive")), tags$hr(), tags$hr(),
                       menuItem("Reporte de errores, sugerencias:", icon = icon("bug"),
                                href = "https://github.com/Crparedes/validaR/issues"),
                       menuItem("Bibliografía", tabName = "bibliogr", icon = icon("book"))))
