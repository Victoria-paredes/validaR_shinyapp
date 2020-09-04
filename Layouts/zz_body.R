customBody <- dashboardBody(
  withMathJax(),
  tabItems(
    tabItem(tabName = "introd", h2('Herramientas para la validación de métodos'), lyIntroduccionDscrp, lyIntroduccion),#, introductionModuleUI('introduction')),
    tabItem(tabName = "defini", h2('Terminos relevantes en la validación de métodos cuantitativos'),
            definicionesUI(id = 'definiciones')),#, introductionModuleUI('introduction')),
    tabItem(tabName = "ingrManDat", h2('Ingreso de datos a la aplicación'), lyIngresoDat),
    tabItem(tabName = "estDescri", h2("Estadística descriptiva"), lyEstadisticaDescriptiva),#, settingsDs),
    tabItem(tabName = "estPruebas", h2("Generalidades de las pruebas de comparación"), lyPruebasComparacion),
            tabItem(tabName = 'PrCmp_Med', h2("Pruebas de comparación de medias"), lyCompMedias),
    tabItem(tabName = "estRegr", h2("Regresiones")),#, LytDatInput),
    tabItem(tabName = "select", h2("Parámetros de validación: Selectividad")),#, LytProfiles),
    tabItem(tabName = "exacti", h2("Parámetros de validación: Exactitud"), lyExactitud),#, LytPermCoef),
    tabItem(tabName = "lineali", h2("Parámetros de validación: Linealidad")),#, LytSepFactor),
    tabItem(tabName = "limDetec", h2("Parámetros de validación: Límite de detección")),#, LytReuCycl),
    tabItem(tabName = "robust", h2("Parámetros de validación: Robustez")),#, LytSpConc),
    tabItem(tabName = 'planVali', h2("Plan de validación")),#, examplesModuleUI('examples')),
    tabItem(tabName = 'infVali',  h2("Informe de validación")),#, examplesModuleUI('examples')),
    tabItem(tabName = "bibliogr", h2("Bibliografía"), bibliogrModuleUI())
  )
)
