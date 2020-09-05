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
                       menuItem("Introducción", tabName = "introd", icon = icon("question-circle")),
                       menuItem("Definiciones", tabName = "defini", icon = icon("book")), tags$hr(),
                       tags$b('Datos experimentales:'),
                       menuItem("Ingreso de datos", tabName = "ingrManDat", icon = icon("exchange-alt")),
                       menuItem("Banco de datos de ejemplos", tabName = "ejemData", icon = icon("folder-open")), tags$hr(),
                       tags$b('Herramientas estadísticas:'),
                       menuItem("Estadística descriptiva", tabName = "estDescri", icon = icon("")),
                       menuItem("Pruebas de comparación", tabName = "estPruebas", icon = icon("not-equal"),
                                menuSubItem("Comparación de medias", tabName = "PrCmp_Med"),
                                menuSubItem("Comparación de varianzas", tabName = "PrCmp_Var"),
                                menuSubItem("Analisis de varianza (ANOVA)", tabName = "PrCmp_anova"),
                                menuSubItem("Analisis de covarianza (ANCOVA)", tabName = "PrCmp_ancova")),
                       menuItem("Regresiones", tabName = "estRegr", icon = icon("")), tags$hr(),
                       tags$b('Parámetros de validación:'),
                       menuItem("Selectividad", tabName = "select", icon = icon("")),
                       menuItem("Exactitud (Precisión, veracidad)", tabName = "exacti", icon = icon("")),
                       menuItem("Linealidad, intervalo dinámico", tabName = "lineali", icon = icon("")),
                       menuItem("Límite de detección", tabName = "limDetec", icon = icon("")),
                       menuItem("Robustez", tabName = "robust", icon = icon("")), tags$hr(),
                       tags$b('Recursos adicionales:'),
                       menuItem("Plan de validación", tabName = "planVali", icon = icon("")),
                       menuItem("Informe de validación", tabName = "infVali", icon = icon("file-archive")), tags$hr(), tags$hr(),
                       menuItem("Reporte de errores, sugerencias:", icon = icon("bug"),
                                href = "https://github.com/Crparedes/validaR/issues"),
                       menuItem("Bibliografía", tabName = "bibliogr", icon = icon("book"))))
