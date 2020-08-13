customBody <- dashboardBody(
  withMathJax(),
  tabItems(
    tabItem(tabName = "introd", h2('La necesidad de validar un método')),#, introductionModuleUI('introduction')),
    tabItem(tabName = "defini", h2('Definiciones')),#, introductionModuleUI('introduction')),
    tabItem(tabName = "estDescri", h2("Estadística descriptiva")),#, settingsDs),
    tabItem(tabName = "estPruebas", h2("Pruebas de comparación")),#, LytCalibration),
    tabItem(tabName = "estRegr", h2("Regresiones")),#, LytDatInput),
    tabItem(tabName = "select", h2("Parámetros de validación: Selectividad")),#, LytProfiles),
    tabItem(tabName = "exacti", h2("Parámetros de validación: Exactitud")),#, LytPermCoef),
    tabItem(tabName = "lineali", h2("Parámetros de validación: Linealidad")),#, LytSepFactor),
    tabItem(tabName = "limDetec", h2("Parámetros de validación: Límite de detección")),#, LytReuCycl),
    tabItem(tabName = "robust", h2("Parámetros de validación: Robustez")),#, LytSpConc),
    tabItem(tabName = 'planVali', h2("Plan de validación")),#, examplesModuleUI('examples')),
    tabItem(tabName = 'infVali',  h2("Informe de validación")),#, examplesModuleUI('examples')),
    tabItem(tabName = "bibliography", h2("Bibliography"))#, bibliographyModuleUI())
  )
)
