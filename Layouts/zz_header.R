customHeader <- dashboardHeader(tags$li(class = "dropdown",
                            tags$style(".main-header {max-height: 90px}"),
                            tags$style(".main-header .logo {height: 90px}")),
                    titleWidth = 4000,
                    title = tags$div(HTML('<table text-align= left cellspacing = 0 cellPadding=0>
    <tr><th rowspan = 2><a id="logo" href="http://www.inm.gov.co"
    title="Instituto Nacional de Metrología - INM" data-height="80">
    <img
    src="http://www.inm.gov.co/nueva/wp-content/uploads/2019/03/Logo_Instituto_INM_y_Gobierno2019_4.png"
    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th><h1 style="LINE-HEIGHT:5px">validaR: Validación de métodos químicos cuantitativos</h1></th></tr>
    <tr><th><h3 style="LINE-HEIGHT:5px">Subdirección de metrología química y biomedicina</h3></th></tr>
    </table>')))
