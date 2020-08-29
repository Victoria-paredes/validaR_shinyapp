tiposVar <- c('Datos univariados (var.X1)', 'Curva de calibración (var.X2) = f(var.X1)', 
              'Curva de calibración (var.X1) = f(var.X2)')

lyEstadisticaDescriptiva <- box(width = 12, #height = 800,
                                estadisticaDescriptivaUI("Series1EstDesc"))
