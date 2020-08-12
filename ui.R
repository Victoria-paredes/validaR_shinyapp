library(shiny)
library(shinydashboard)


shinyUI(
  dashboardPage(skin = "black",
    dashboardHeader(tags$li(class = "dropdown",
                            tags$style(".main-header {max-height: 90px}"),
                            tags$style(".main-header .logo {height: 90px}")),
                    titleWidth = 2000,
                    title = tags$div(HTML('<table text-align= left cellspacing = 0 cellPadding=0>
    <tr><th rowspan = 2><a id="logo" href="http://www.inm.gov.co"
    title="Instituto Nacional de Metrología - INM" data-height="80">
    <img
    src="http://www.inm.gov.co/nueva/wp-content/uploads/2019/03/Logo_Instituto_INM_y_Gobierno2019_4.png"
    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th><h1 style="LINE-HEIGHT:5px">Validación de métodos químicos cuantitativos</h1></th></tr>
    <tr><th><h3 style="LINE-HEIGHT:5px">Subdirección de metrología química y biomedicina</h3></th></tr>
    </table>'))),
    dashboardSidebar(tags$style(".left-side, .main-sidebar {padding-top: 110px}"),
                     menuItem("Introducción", tabName = "introd", icon = icon("question-circle")), tags$hr(),
                     tags$b('Herramientas estadísticas:'),
                     menuItem("Estadística descriptiva", tabName = "estDescri", icon = icon("")),
                     menuItem("Pruebas de comparación", tabName = "estPruebas", icon = icon("")),
                     menuItem("Regresiones", tabName = "estRegr", icon = icon("")), tags$hr(),
                     tags$b('Parámetros de validación:'),
                     menuItem("Selectividad", tabName = "select", icon = icon("")),
                     menuItem("Exactitud (Precisión, veracidad)", tabName = "exacti", icon = icon("")),
                     menuItem("Linealidad, intervalo dinámico", tabName = "lineali", icon = icon("")),
                     menuItem("Límite de detección", tabName = "limDetec", icon = icon("")),
                     menuItem("Robustez", tabName = "", icon = icon("")), tags$hr(),
                     tags$b('Recursos adicionales:'),
                     menuItem("Plan de validación", tabName = "planVali", icon = icon("")),
                     menuItem("Informe de validación", tabName = "infVali", icon = icon(""))),
    dashboardBody()
  )
)
