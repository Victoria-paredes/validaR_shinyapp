customHeader <- dashboardHeader(tags$li(class = "dropdown",
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
    </table>

      <div class="banner_wrapper">
      <table style="float:center;border-style: none;background: none; border-style: none;
                    line-height: 10%;padding: 1% 1% 1% 1%;transition: background-color .2s ease-in-out,
                    color .2s ease-in-out;display: flex; justify-content: left;align-items: center;"><tbody>
        <tr>
        <td><a href="https://www.facebook.com/INMdeColombia" rel="noopener noreferrer" target="_blank">
            <i class="icon-facebook"></i></a></td>
        <td><a href="https://twitter.com/@inmdecolombia" target="_blank"><i class="icon-twitter"></i></a></td>
        <td><a href="https://co.linkedin.com/company/inmdecolombia" target="_blank"><i class="icon-linkedin"></i></a></td>
        <td><a href="https://www.youtube.com/channel/UCzUnkfCvXjP1YtZIhsP-gtA?feature=mhee" target="_blank">
            <i class="icon-youtube"></i></a></td>
        <td><a href="http://www.inm.gov.co/contactenos/"><i class="icon-mail-line"></i></a></td>
        <td><a href="http://www.inm.gov.co/mapa-del-sitio/"><i class="icon-flow-tree"></i></a></td>
        </tr></tbody></table></div>')))
