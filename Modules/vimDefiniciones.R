nomConceptos <- list(" " = 0, 
                     "Indicación" = 1,
                     "Indicación del blanco" = 2,
                    "termino de prueba" = 3)

conceptos <- list(
  Indicacion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Indicación:"),
                   h4("Valor proporcionado por un instrumento o sistema de medida"), tags$hr(),
                   h4("NOTA 1 La indicación puede presentarse en forma visual o acústica, o puede transferirse a otro
                                 dispositivo. Frecuentemente viene dada por la posición de una aguja en un cuadrante para salidas
                                 analógicas, por un número visualizado o impreso para salidas digitales, por un código para salidas
                                 codificadas, o por el valor asignado para el caso de medidas materializadas."),
                   h4("NOTA 2 La indicación y el valor de la magnitud medida correspondiente no son necesariamente
                                 valores de magnitudes de la misma naturaleza."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  IndicacionDeBlanco = box(width = 12, solidHeader = FALSE, status = 'primary',
                           title = tags$b("Indicación de blanco:"),
                           h4("Indicación obtenida a partir de un fenómeno, cuerpo
                               o sustancia similar al que está en estudio, cuya magnitud de interés se supone no está
                               presente o no contribuye a la indicación."),
                           p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]"))
  )
