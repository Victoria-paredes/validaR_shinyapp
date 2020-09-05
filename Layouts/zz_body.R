customBody <- dashboardBody(
  withMathJax(),
  tabItems(
    tabItem(tabName = "introd", h2('Herramientas para la validación de métodos'), lyIntroduccionDscrp, lyIntroduccion),#, introductionModuleUI('introduction')),
    tabItem(tabName = "defini", h2('Terminos relevantes en la validación de métodos cuantitativos'),
            definicionesUI(id = 'definiciones')),#, introductionModuleUI('introduction')),
    tabItem(tabName = "ingrManDat", h2('Ingreso de datos a la aplicación'), lyIngresoDatDscrp, lyIngresoDat),
    tabItem(tabName = "ejemData", h2('Series de datos de ejemplo')),
    tabItem(tabName = "estDescri", h2("Estadística descriptiva"), lyEstadisticaDescriptiva),#, settingsDs),
    #tabItem(tabName = "estPruebas", h2("Generalidades de las pruebas de comparación"), lyPruebasComparacion),
            tabItem(tabName = 'PrCmp_Med', h2("Pruebas de comparación de medias"), lyCompMediasDscrp, lyCompMedias),
            tabItem(tabName = 'PrCmp_Var', h2("Pruebas de comparación de varianzas"), lyCompVarianDscrp, lyCompVarian), 
    #Pensar en las de varias varianzas: Levene? Cochran? Barlett? todas?
            tabItem(tabName = 'PrCmp_anova', h2("ANOVA: Análisis de varianza para comparar varias medias muestrales"), 
                    lyCompANOVADscrp, lyCompANOVA), 
            tabItem(tabName = 'PrCmp_ancova', h2("ANCOVA: Análisis de covarianza"), 
                    lyCompANCOVADscrp, lyCompANCOVA),
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
