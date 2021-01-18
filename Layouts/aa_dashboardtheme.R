# INSPIRED IN poor_mans_flatly from https://github.com/nik01010/dashboardthemes/blob/master/R/Theme_PoorMansFlatly.R

# Theme: Poor Man's Flatly ------------------------------------------------------------------------------
customTheme <- shinyDashboardThemeDIY(
  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(0,0,0)"
  ,primaryFontColor = "rgb(0,0,0)"
  ,infoFontColor = "rgb(0,0,0)"
  ,successFontColor = "rgb(0,0,0)"
  ,warningFontColor = "rgb(0,0,0)"
  ,dangerFontColor = "rgb(0,0,0)"
  ,bodyBackColor = "rgb(255,255,255)"
  
  ### header
  ,logoBackColor = "rgb(255,255,255)"
  
  ,headerButtonBackColor = "rgb(238,238,238)"
  ,headerButtonIconColor = "rgb(75,75,75)"
  ,headerButtonBackColorHover = "rgb(21,21,21)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"
  
  ,headerBackColor = "rgb(23,28,28)"
  ,headerBoxShadowColor = "#000000"
  ,headerBoxShadowSize = "3px 3px 3px"
  
  ### sidebar
  ,sidebarBackColor = cssGradientThreeColors(
    direction = "down"
    ,colorStart = "rgb(20,97,117)"
    ,colorMiddle = "rgb(56,161,187)"
    ,colorEnd = "rgb(0, 24, 72)"
    ,colorStartPos = 0
    ,colorMiddlePos = 50
    ,colorEndPos = 80
  )
  ,sidebarPadding = 0
  
  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0
  
  ,sidebarShadowRadius = "3px 5px 5px"
  ,sidebarShadowColor = "#aaaaaa"
  
  ,sidebarUserTextColor = "rgb(255,255,255)"
  
  ,sidebarSearchBackColor = "rgb(55,72,80)"
  ,sidebarSearchIconColor = "rgb(153,153,153)"
  ,sidebarSearchBorderColor = "rgb(55,72,80)"
  
  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 12
  ,sidebarTabBorderStyle = "none none solid none"
  ,sidebarTabBorderColor = "rgb(35,106,135)"
  ,sidebarTabBorderWidth = 1
  
  ,sidebarTabBackColorSelected = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(52, 177, 201)"
    ,colorMiddle = "rgb(52, 177, 201)"
    ,colorEnd = "rgb(151,255,255)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorSelected = "rgb(0,0,0)"
  ,sidebarTabRadiusSelected = "0px 20px 20px 0px"
  
  ,sidebarTabBackColorHover = cssGradientThreeColors(
    direction = "right"
    ,colorStart = "rgb(151,255,255)"
    ,colorMiddle = "rgb(151,255,255)"
    ,colorEnd = "rgb(211,255,255)"
    ,colorStartPos = 0
    ,colorMiddlePos = 30
    ,colorEndPos = 100
  )
  ,sidebarTabTextColorHover = "rgb(50,50,50)"
  ,sidebarTabBorderStyleHover = "none none solid none"
  ,sidebarTabBorderColorHover = "rgb(75,126,151)"
  ,sidebarTabBorderWidthHover = 1
  ,sidebarTabRadiusHover = "0px 20px 20px 0px"
  
  ### boxes
  ,boxBackColor = "rgb(245,245,245)"
  ,boxBorderRadius = 5
  ,boxShadowSize = "0px 1px 1px"
  ,boxShadowColor = "rgba(0,0,0,.4)"
  ,boxTitleSize = 16
  ,boxDefaultColor = "rgb(210,214,220)"
  ,boxPrimaryColor = "rgb(44,62,80)"
  ,boxInfoColor = "rgb(210,214,220)"
  ,boxSuccessColor = "rgba(0,255,213,1)"
  ,boxWarningColor = "rgb(52, 177, 201)"
  ,boxDangerColor = "rgb(255,88,55)"
  
  ,tabBoxTabColor = "rgb(248,248,248)"
  ,tabBoxTabTextSize = 14
  ,tabBoxTabTextColor = "rgb(0,0,0)"
  ,tabBoxTabTextColorSelected = "rgb(0,0,0)"
  ,tabBoxBackColor = "rgb(248,248,248)"
  ,tabBoxHighlightColor = "rgb(44,62,80)"
  ,tabBoxBorderRadius = 5
  
  ### inputs
  ,buttonBackColor = "rgb(44,62,80)"
  ,buttonTextColor = "rgb(245,245,245)"
  ,buttonBorderColor = "rgb(200,200,200)"
  ,buttonBorderRadius = 5
  
  ,buttonBackColorHover = "rgb(25,25,25)"
  ,buttonTextColorHover = "rgb(200,200,200)"
  ,buttonBorderColorHover = "rgb(200,200,200)"
  
  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(200,200,200)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(245,245,245)"
  ,textboxBorderColorSelect = "rgb(200,200,200)"
  
  ### tables
  ,tableBackColor = "rgb(255,255,255)"
  ,tableBorderColor = "rgb(240,240,240)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1
)

a <- shinyDashboardThemeDIY(
  ### general
  appFontFamily = "Arial"
  ,appFontColor = "rgb(33,37,41)"
  ,primaryFontColor = "rgb(24,24,24)"
  ,infoFontColor = "rgb(245,245,245)"
  ,successFontColor = "rgb(33,37,41)"
  ,warningFontColor = "rgb(33,37,41)"
  ,dangerFontColor = "rgb(33,37,41)"
  ,bodyBackColor = "rgb(252,252,252)"
  
  ### header
  ,logoBackColor = "rgb(24,188,156)"
  ,headerButtonBackColor = "rgb(24,188,156)"
  ,headerButtonIconColor = "rgb(44,62,80)"
  ,headerButtonBackColorHover = "rgb(20,154,128)"
  ,headerButtonIconColorHover = "rgb(0,0,0)"
  
  ,headerBackColor = "rgb(24,188,156)"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"
  
  ### sidebar
  ,sidebarBackColor = "rgb(44,62,80)"
  ,sidebarPadding = 0
  
  ,sidebarMenuBackColor = "inherit"
  ,sidebarMenuPadding = 0
  ,sidebarMenuBorderRadius = 0
  
  ,sidebarShadowRadius = ""
  ,sidebarShadowColor = "0px 0px 0px"
  
  ,sidebarUserTextColor = "rgb(255,255,255)"
  
  ,sidebarSearchBackColor = "rgb(255,255,255)"
  ,sidebarSearchIconColor = "rgb(44,62,80)"
  ,sidebarSearchBorderColor = "rgb(255,255,255)"
  
  ,sidebarTabTextColor = "rgb(255,255,255)"
  ,sidebarTabTextSize = 14
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = 0
  
  ,sidebarTabBackColorSelected = "rgb(30,43,55)"
  ,sidebarTabTextColorSelected = "rgb(24,188,156)"
  ,sidebarTabRadiusSelected = "0px"
  
  ,sidebarTabBackColorHover = "rgb(44,62,80)"
  ,sidebarTabTextColorHover = "rgb(24,188,156)"
  ,sidebarTabBorderStyleHover = "none"
  ,sidebarTabBorderColorHover = "none"
  ,sidebarTabBorderWidthHover = 0
  ,sidebarTabRadiusHover = "0px"
  
  ### boxes
  ,boxBackColor = "rgb(247,247,247)"
  ,boxBorderRadius = 4
  ,boxShadowSize = "0px 1px 1px"
  ,boxShadowColor = "rgb(44,62,80)"
  ,boxTitleSize = 16
  #,boxTitleColor = "rgb(44,62,80)"
  ,boxDefaultColor = "rgb(119,156,171)"
  ,boxPrimaryColor = "rgb(44,62,80)"
  ,boxInfoColor = "rgb(114,24,23)"
  ,boxSuccessColor = "rgb(187, 191, 170)"
  ,boxWarningColor = "rgb(229, 164, 203)"
  ,boxDangerColor = "rgb(255, 225, 168)"
  
  ,tabBoxTabColor = "rgb(44,62,80)"
  ,tabBoxTabTextSize = 13
  ,tabBoxTabTextColor = "rgb(44,62,80)"
  ,tabBoxTabTextColorSelected = "rgb(255, 255, 255)"
  ,tabBoxBackColor = "rgb(242,242,242)"
  ,tabBoxHighlightColor = "rgb(44,62,80)"
  ,tabBoxBorderRadius = 5

  ### inputs
  ,buttonBackColor = "rgb(44,62,80)"
  ,buttonTextColor = "rgb(255,255,255)"
  ,buttonBorderColor = "rgb(44,62,80)"
  ,buttonBorderRadius = 5
  
  ,buttonBackColorHover = "rgb(30,43,55)"
  ,buttonTextColorHover = "rgb(255,255,255)"
  ,buttonBorderColorHover = "rgb(30,43,55)"
  
  ,textboxBackColor = "rgb(255,255,255)"
  ,textboxBorderColor = "rgb(206,212,218)"
  ,textboxBorderRadius = 5
  ,textboxBackColorSelect = "rgb(255,255,255)"
  ,textboxBorderColorSelect = "rgb(89,126,162)"
  
  ### tables
  ,tableBackColor = "rgb(255,255,255)"
  ,tableBorderColor = "rgb(236,240,241)"
  ,tableBorderTopSize = 1
  ,tableBorderRowSize = 1
  
)