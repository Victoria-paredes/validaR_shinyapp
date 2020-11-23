nomConceptos <- list(" " = 0, 
                     "Magnitud" = 1,
                     "Sistema de magnitudes" = 2,
                     
                     
                     
                     "Indicación" = 1,
                     "Indicación del blanco" = 2,
                     "Termino de prueba" = 3)

conceptos <- list(
  Magnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Magnitud:"),
                   h4("Propiedad de un fenómeno, cuerpo o sustancia, que puede expresarse cuantitativamente mediante un número y una referencia"), tags$hr(),
                   h4("NOTA 1 El concepto genérico de magnitud
puede dividirse en varios niveles de conceptos
específicos, como muestra la tabla siguiente. La
mitad izquierda de la tabla presenta conceptos
específicos de “magnitud”. Estos (a su vez) son
conceptos genéricos para las magnitudes
individuales mostradas en la columna derecha de
la tabla. "),
                   h4("NOTA 2 La referencia puede ser una unidad de
medida, un procedimiento de medición, un
material de referencia o una combinación de
ellos. 
"),
                   h4("NOTA 3 Las series de normas internacionales
ISO 80000 e IEC 80000 Magnitudes y Unidades,
establecen los símbolos de las magnitudes.
Estos símbolos se escriben en caracteres
itálicos. Un símbolo dado puede referirse a
magnitudes diferentes."),
                    h4("NOTA 4 El formato preferido por la IUPAC/IFCC
para la designación de las magnitudes en
laboratorios médicos es “Sistema-Componente;
naturaleza de la magnitud”."),
  h4("NOTA 5 Una magnitud, tal como se define aquí,
es una magnitud escalar. Sin embargo, un vector
o un tensor, cuyas componentes sean
magnitudes, también se considera como una
magnitud."),
  h4("NOTA 6 El concepto de “magnitud” puede
dividirse, de forma genérica por ejemplo, en
“magnitud física”, “magnitud química” y “magnitud
biológica”, o bien en magnitud de base y
magnitud derivada."),
  p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
  
  
  Sistemademagnitudes = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sistema de magnitudes:"),
                   h4("conjunto de magnitudes asociado a un conjunto de ecuaciones no contradictorias que relaciona entre sí a dichas magnitudes"), tags$hr(),
                   h4("NOTA 1  Las magnitudes ordinales, tales como
la dureza Rockwell C, generalmente no se
consideran parte de un sistema de magnitudes,
porque están relacionadas con otras magnitudes
solamente por relaciones empíricas."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
    Sistemainternacionaldemagnitudes = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sistema internacional de magnitudes:"),
                   h4("sistema de magnitudes basado en las siete
magnitudes de base: longitud, masa, tiempo,
corriente eléctrica, temperatura termodinámica,
cantidad de sustancia e intensidad luminosa"), tags$hr(),
                   h4("NOTA 1 Este sistema de magnitudes está
publicado en las series de normas
internacionales ISO 80000 e IEC 80000,
Magnitudes y Unidades."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
    Dimensiondeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Dimensión de una magnitud:"),
                   h4("expresión de la dependencia de una magnitud
en términos de las magnitudes de base, dentro
de un sistema de magnitudes, como el
producto de potencias de factores
correspondientes a dichas magnitudes de base,
omitiendo cualquier factor numérico"), tags$hr(),
                   h4("NOTA 1 Una potencia de un factor es dicho
factor elevado a un exponente. Cada factor
expresa la dimensión de una magnitud de base."),
h4("NOTA 2 Por convención, el símbolo de la
dimensión de una magnitud de base es una letra
mayúscula en caracteres romanos (rectos) tipo
sans-serif . Por convención, la representación
simbólica de la dimensión de una magnitud
derivada es el producto de potencias de las
dimensiones de las magnitudes de base
conforme a la definición de la magnitud
derivada. La dimensión de la magnitud Q se
denota como dim Q"),
h4("NOTA 3 Para establecer la dimensión de una
magnitud, no se tiene en cuenta el carácter
escalar, vectorial o tensorial de la misma."),
h4("NOTA 4 En un sistema de magnitudes
determinado las magnitudes de la misma naturaleza tienen
la misma dimensión, las magnitudes de dimensiones diferentes son
siempre de naturaleza diferente y las magnitudes que tienen la misma
dimensión no son necesariamente de la misma naturaleza."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
    Unidaddemedida = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Unidad de medida:"),
                   h4("magnitud escalar real, definida y adoptada
por convención, con la que se puede
comparar cualquier otra magnitud de la
misma naturaleza para expresar la razón
entre ambas mediante un número"), tags$hr(),
                   h4("NOTA 1 Las unidades de medida se
expresan mediante nombres y símbolos,
asignados por convención."),
h4("NOTA 2  Las unidades de medida de las
magnitudes que tienen la misma dimensión,
pueden designarse por el mismo nombre y el
mismo símbolo, aunque no sean de la misma
naturaleza. Por ejemplo, se emplea el nombre
“joule por kelvin” y el símbolo J/K para
designar a la vez una unidad de capacidad
térmica y una unidad de entropía, aunque
estas magnitudes no sean consideradas en
general de la misma naturaleza. Sin embargo,
en ciertos casos, se utilizan nombres
especiales exclusivamente para magnitudes
de una naturaleza específica. Por ejemplo la
unidad “segundo a la potencia menos uno”
(1/s) se denomina hertz (Hz) para las
frecuencias y becquerel (Bq) para las
actividades de radionucleidos."),
h4("NOTA 3 Las unidades de medida de las
magnitudes de dimensión uno son
números. En ciertos casos se les da nombres
especiales; por ejemplo radián, estereorradián
y decibel, o se expresan mediante cocientes
como el milimol por mol, igual a 10-3, o el microgramo por kilogramo, igual a 10-9."),
h4("NOTA 4 Para una magnitud dada, el nombre
abreviado “unidad” se combina
frecuentemente con el nombre de la
magnitud, por ejemplo “unidad de masa.”"),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

  termino = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("termino:"),
                   h4("definicion"), tags$hr(),
                   h4("NOTA #."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  termino = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("termino:"),
                   h4("definicion"), tags$hr(),
                   h4("NOTA #."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  termino = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("termino:"),
                   h4("definicion"), tags$hr(),
                   h4("NOTA #."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
  
  
  
  
  
  
  
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
