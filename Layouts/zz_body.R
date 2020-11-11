customBody <- dashboardBody(
  withMathJax(),
  tabItems(
    tabItem(tabName = "introd", h2('Herramientas para la validación de métodos'), introduccionLy),#, introductionModuleUI('introduction')),
    tabItem(tabName = "defini", h2('Terminos relevantes en la validación de métodos cuantitativos'),
            definicionesUI(id = 'definiciones')),#, introductionModuleUI('introduction')),
    tabItem(tabName = "config", h2('Configuración de los archivos descargables'), configDwnFilesUI('configDwnFiles')),
    tabItem(tabName = "ingrManDat", h2('Ingreso de datos a la aplicación'), lyIngresoDatDscrp, lyIngresoDat),
    tabItem(tabName = "ejemData", h2('Series de datos de ejemplo'), datosEjemploUI('examples')),
    tabItem(tabName = "estDescri", h2("Estadística descriptiva"), estadisticaDescriptivaUI("EstDesc")),
    #tabItem(tabName = "estPruebas", h2("Generalidades de las pruebas de comparación"), lyPruebasComparacion),
            tabItem(tabName = 'PrCmp_Med', h2("Pruebas de comparación de medias"), lyCompMediasDscrp, lyCompMedias),
            tabItem(tabName = 'PrCmp_Var', h2("Pruebas de comparación de varianzas"), lyCompVarianDscrp, lyCompVarian), 
    #Pensar en las de varias varianzas: Levene? Cochran? Barlett? todas?
            tabItem(tabName = 'PrCmp_anova', h2("ANOVA: Análisis de varianza para comparar varias medias muestrales"), 
                    lyCompANOVADscrp, lyCompANOVA), 
            tabItem(tabName = 'PrCmp_ancova', h2("ANCOVA: Análisis de covarianza"), 
                    lyCompANCOVADscrp, lyCompANCOVA),
    tabItem(tabName = "estRegr", h2("Regresiones"), lyRegresionDscrp, lyRegresion),
    tabItem(tabName = "select", h2("Parámetros de validación: Selectividad")),
    tabItem(tabName = "exacti", h2("Parámetros de validación: Exactitud"), lyExactitud),
    tabItem(tabName = "lineali", h2("Parámetros de validación: Linealidad")),
    tabItem(tabName = "limDetec", h2("Parámetros de validación: Límite de detección")),
    tabItem(tabName = "robust", h2("Parámetros de validación: Robustez"), lyRobustezDscrp, lyRobustez),
    tabItem(tabName = 'planVali', h2("Plan de validación")),
    tabItem(tabName = 'infVali',  h2("Informe de validación")),
    tabItem(tabName = "bibliogr", h2("Bibliografía"), bibliogrModuleUI())
  )
)
