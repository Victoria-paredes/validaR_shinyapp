nomConceptos <- list(" " = 0, 
                     "Magnitud" = 1,
                     "Sistema de magnitudes" = 2,
                     "Sistema internacional de magnitudes" = 3,
                     "Dimensión de una magnitud" = 4,
                     "Unidad de medida" = 5,
                     "Sistema de unidades" = 6,
                     "Sistema Internacional de Unidades" = 7,
                     "Valor de una magnitud" = 8,
                     "Valor numérico de una magnitud" = 9,
                     "Factor de conversión entre unidades" = 10,
                     "Magnitud ordinal" = 11,
                     "Propiedad cualitativa" = 12,
                     "Medición" = 13,
                     "Metrología" = 14,
                     "Mesurando" = 15,
                     "Principio de medición" = 16,
                     "Método de medición" = 17,
                     "Procedimiento de medición" = 18,
                     "Procedimiento de medición de referencia" = 19, 
                     "Procedimiento de medición primario" = 20,
                     "Resultado de medición" = 21,
                     "Valor medido de una magnitud" = 22,
                     "Valor verdadero de una magnitud" = 23,
                     "Valor convencional de una magnitud" = 24,
                     "Exactitud de una medición" = 25,
                     "Veracidad de medición" = 26,
                     "Precisión de medición" = 27,
                     
                  
                     

                     
                     
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
específicos de 'magnitud'. Estos (a su vez) son
conceptos genéricos para las magnitudes
individuales mostradas en la columna derecha de
la tabla."),
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
laboratorios médicos es 'Sistema-Componente;
naturaleza de la magnitud'."),
  h4("NOTA 5 Una magnitud, tal como se define aquí,
es una magnitud escalar. Sin embargo, un vector
o un tensor, cuyas componentes sean
magnitudes, también se considera como una
magnitud."),
  h4("NOTA 6 El concepto de 'magnitud' puede
dividirse, de forma genérica por ejemplo, en
'magnitud física', 'magnitud química' y 'magnitud
biológica', o bien en magnitud de base y
magnitud derivada."),
  p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),
  
  
  
  Sistemademagnitudes = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sistema de magnitudes:"),
                   h4("Conjunto de magnitudes asociado a un conjunto de ecuaciones no contradictorias que relaciona entre sí a dichas magnitudes"), tags$hr(),
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
                   h4("Expresión de la dependencia de una magnitud
en términos de las magnitudes de base, dentro
de un sistema de magnitudes, como el
producto de potencias de factores
correspondientes a dichas magnitudes de base,
omitiendo cualquier factor numérico."), tags$hr(),
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
denota como dim Q."),
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
                   h4("Magnitud escalar real, definida y adoptada
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
'joule por kelvin' y el símbolo J/K para
designar a la vez una unidad de capacidad
térmica y una unidad de entropía, aunque
estas magnitudes no sean consideradas en
general de la misma naturaleza. Sin embargo,
en ciertos casos, se utilizan nombres
especiales exclusivamente para magnitudes
de una naturaleza específica. Por ejemplo la
unidad 'segundo a la potencia menos uno'
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
abreviado 'unidad' se combina
frecuentemente con el nombre de la
magnitud, por ejemplo 'nidad de masa'."),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

  Sistemadeunidades = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sistema de unidades:"),
                   h4("Conjunto de unidades de base y unidades
derivadas, sus múltiplos y submúltiplos,
definidos conforme a reglas dadas, para un
sistema de magnitudes dado"), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

  Sistemainternacionaldeunidades = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sistema Internacional de Unidades:"),
                   h4("Sistema de unidades basado en el Sistema
Internacional de Magnitudes, con nombres
y símbolos de las unidades, y con una serie
de prefijos con sus nombres y símbolos, así
como reglas para su utilización, adoptado por
la Conferencia General de Pesas y Medidas
(CGPM)"), tags$hr(),
                   h4("NOTA 1 El SI está basado en las siete magnitudes de base del Sistema Internacional de Magnitudes. Los 
símbolos de las unidades de base se presentan en la imagen siguiente:.
PONER IMAGEN AQUÍ"),
h4("NOTA 2 Las unidades de base y las
unidades derivadas coherentes del SI
forman un conjunto coherente, denominado
'conjunto de unidades SI coherentes'."),
h4("NOTA 3 Una descripción y explicación
completas del Sistema Internacional de
Unidades puede encontrarse en la última
edición del folleto sobre el SI, publicado por
la Oficina Internacional de Pesas y Medidas
(BIPM) y disponible en la página de internet
del BIPM."),
h4("NOTA 4 En el álgebra de magnitudes, la
magnitud 'número de entidades' se
considera frecuentemente como magnitud de
base, con unidad básica uno, símbolo 1."),
h4("NOTA 5 PREGUNTAR SI PONER O NO"),
p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

  Valordeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Valor de una magnitud:"),
                   h4("Conjunto formado por un número y una
referencia, que constituye la expresión
cuantitativa de una magnitud "), tags$hr(),
                   h4("NOTA 1 Según el tipo de referencia, el valor
de una magnitud puede ser el producto de un número y una unidad de
medida; la unidad uno generalmente no se
indica para las magnitudes
adimensionales,o un número y la referencia a un
procedimiento de medición, o un número y un material de referencia."),
h4("NOTA 2 El número puede ser complejo."),
h4("NOTA 3 El valor de una magnitud puede
representarse de varias maneras."),
h4("NOTA 4 En el caso de las magnitudes
vectoriales o tensoriales, cada componente
tiene un valor."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Valornumericodeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Valor numérico de una magnitud:"),
                   h4("Número empleado en la expresión del valor de
una magnitud, diferente del utilizado como referencia."), tags$hr(),
                   h4("NOTA 1 Para las magnitudes de dimensión
uno, la referencia es una unidad de medida
que es un número. Este número no se
considera parte del valor numérico."),
h4("NOTA 2 Para las magnitudes que tienen una
unidad de medida (esto es, magnitudes
diferentes a las magnitudes ordinales),
el valor numérico {Q} de una magnitud Q
con frecuencia se representa como {Q} =
Q/[Q], donde [Q] es el símbolo de la
unidad de medida."),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Factordeconversionentreunidades = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Factor de conversión entre unidades:"),
                   h4("Razón entre dos unidades de medida
correspondientes a magnitudes de la misma
naturaleza"), tags$hr(),
                   h4("NOTA 1 Las unidades de medida pueden
pertenecer a sistemas de unidades diferentes."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Magnitudordinal = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Magnitud ordinal:"),
                   h4("Magnitud definida por un procedimiento de
medición adoptado por convención, que puede
clasificarse con otras magnitudes de la misma
naturaleza según el orden creciente o
decreciente de sus valores cuantitativos, pero
para las cuales no existen operaciones
algebraicas entre ellas."), tags$hr(),
                   h4("NOTA 1 Las magnitudes ordinales solamente pueden formar parte de las relaciones
empíricas y no tienen ni unidades de medida,
ni dimensiones. Las diferencias y los cocientes
entre magnitudes ordinales no tienen
significado físico."),
h4("NOTA 2  Las magnitudes ordinales se ordenan
según escalas ordinales."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Propiedadcualitativa = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Propiedad cualitativa:"),
                   h4("Propiedad de un fenómeno, cuerpo o sustancia,
que no puede expresarse cuantitativamente."), tags$hr(),
                   h4("NOTA 1 Una propiedad cualitativa tiene un
valor que puede expresarse mediante palabras,
códigos alfanuméricos u otros medios."),
h4("NOTA 2  El valor de una propiedad cualitativa
no debe confundirse con el valor nominal de
una magnitud."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Medicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Medición:"),
                   h4("Proceso que consiste en obtener
experimentalmente uno o varios valores que
pueden atribuirse razonablemente a una
magnitud."), tags$hr(),
                   h4("NOTA 1 Las mediciones no se aplican a las
propiedades cualitativas."),
h4("NOTA 2 La medición supone una comparación
de magnitudes o el conteo de entidades."),
h4("NOTA 3 Una medición supone una descripción
de la magnitud compatible con el uso previsto
de un resultado de medición, un
procedimiento de medición y un sistema de
medición calibrado operando conforme a un
procedimiento de medición especificado,
incluyendo las condiciones de medición."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Metrologia = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Metrología:"),
                   h4("Ciencia de las mediciones y sus aplicaciones"), tags$hr(),
                   h4("NOTA 1 La metrología incluye todos los
aspectos teóricos y prácticos de las
mediciones, cualesquiera que sean su
incertidumbre de medición y su campo de
aplicación."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

    Mensurando = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Mensurando:"),
                   h4("Magnitud que se desea medir"), tags$hr(),
                   h4("NOTA 1 La especificación de un mensurando
requiere el conocimiento de la naturaleza de la
magnitud y la descripción del estado del
fenómeno, cuerpo o sustancia que tiene a dicha
magnitud como una propiedad, incluyendo las
componentes relevantes y las entidades
químicas involucradas."),
h4("NOTA 2 En la 2ª edición del VIM y en IEC
60050-300:2001, el mensurando está definido
como la “magnitud sujeta a medición”."),
                     h4("NOTA 3 La medición, incluyendo el sistema
de medición y las condiciones bajo las cuales
se realiza ésta, podría alterar el fenómeno, cuerpo o sustancia, de tal forma que la
magnitud que se está midiendo puede diferir del
mensurando tal como ha sido definido. En este
caso sería necesario efectuar la corrección
apropiada cuerpo o sustancia, de tal forma que la
magnitud que se está midiendo puede diferir del
mensurando tal como ha sido definido. En este
caso sería necesario efectuar la corrección
apropiada."),
h4("NOTA 4 En química, la 'sustancia a analizar',
el analito, o el nombre de una sustancia o de un
compuesto, se emplean algunas veces en lugar
de 'mensurando'. Esta práctica es errónea
debido a que estos términos no se refieren a
magnitudes."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

   Principiodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Principio de medición:"),
                   h4("Fenómeno que sirve como base de una medición."), tags$hr(),
                   h4("NOTA 1  El fenómeno puede ser de naturaleza
física, química o biológica."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

   Metododemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Método de medición:"),
                   h4("Descripción genérica de la secuencia lógica de
operaciones utilizadas en una medición."), tags$hr(),
                   h4("NOTA 1 Los métodos de medición pueden
clasificarse de varias maneras, como método de sustitución, método diferencial, y método de cero; o método directo, y método indirecto."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

   Procedimientodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Procedimiento de medición:"),
                   h4("Descripción detallada de una medición
conforme a uno o más principios de medición
y a un método de medición dado, basado en
un modelo de medición y que incluye los
cálculos necesarios para obtener un resultado
de medición."), tags$hr(),
                   h4("NOTA 1 Un procedimiento de medición se
documenta habitualmente con suficiente detalle
para que un operador pueda realizar una
medición."),
h4("NOTA 2 Un procedimiento de medición puede
incluir un enunciado referido a una
incertidumbre de medición objetivo."),
                                 h4("NOTA 3 El procedimiento de medición a veces
se denomina standard operating procedure
(SOP) en inglés, o mode opératoire de mesure
en francés."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

   Procedimientodemediciondereferencia = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Procedimiento de medición de referencia:"),
                   h4("Procedimiento de medición aceptado para
producir resultados de medición apropiados
para su uso previsto en la evaluación de la
veracidad de los valores medidos obtenidos a
partir de otros procedimientos de medición,
para magnitudes de la misma naturaleza, para
una calibración o para la caracterización de
materiales de referencia"), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

   Procedimientodemedicionprimario = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Procedimiento de medición primario:"),
                   h4("Procedimiento de medición de referencia
utilizado para obtener un resultado de
medición, independientemente de cualquier
patrón de medición de una magnitud de la
misma naturaleza."), tags$hr(),
                   h4("NOTA 1 El Comité Consultivo para la Cantidad
de Sustancia – Metrología en Química (CCQM)
utiliza el término “método primario de medición”
para este concepto."),
h4("NOTA 2 Las definiciones de dos conceptos
subordinados, que podrían denominarse
'procedimiento de medición primario directo' y
'procedimiento de medición primario relativo',
están dadas por el CCQM (5ª. Reunión, 1999.")
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Resultadodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Resultado de medición:"),
                   h4("Conjunto de valores de una magnitud
atribuidos a un mensurando, acompañados de
cualquier otra información relevante disponible."), tags$hr(),
                   h4("NOTA 1 Un resultado de medición contiene
generalmente información relevante sobre el
conjunto de valores de una magnitud de modo
que algunos de ellos pueden ser más
representativos del mensurando que otros. Esto
puede expresarse como una función de
densidad de probabilidad (PDF)."),
h4("NOTA 2 El resultado de una medición se
expresa generalmente como un valor medido
único y una incertidumbre de medición. Si la
incertidumbre de medición se considera
despreciable para un determinado fin, el
resultado de medición puede expresarse como
un único valor medido de la magnitud. En
muchos campos ésta es la forma habitual de
expresar el resultado de medición."),
                          h4("NOTA 3 En la bibliografía tradicional y en la
edición precedente del VIM, el término
resultado de medición estaba definido como
un valor atribuido al mensurando y podía
entenderse como una indicación, un resultado
no corregido o un resultado corregido, según el
contexto."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Valormedidodeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Valor medido de una magnitud:"),
                   h4("Valor de una magnitud que representa un
resultado de medición."), tags$hr(),
                   h4("NOTA 1 En una medición que implique
indicaciones repetidas, cada indicación puede
utilizarse para proveer un correspondiente valor
medido de la magnitud. Este conjunto de
valores medidos individuales de la magnitud,
puede utilizarse para calcular un valor medido
resultante de la magnitud, tal como una media o
una mediana, usualmente con una menor
incertidumbre de medición asociada."),
h4("NOTA 2 Cuando la amplitud del intervalo de
valores verdaderos de la magnitud
considerados como representativos del
mensurando es pequeña comparada con la
incertidumbre de la medición, entonces un valor
medido de la magnitud puede considerarse
como una estimación de un valor verdadero,
esencialmente único, siendo habitual utilizar la
media o la mediana de los valores medidos
individuales obtenidos mediante la repetición de
las mediciones."),
h4("NOTA 3 Cuando la amplitud del intervalo de
valores verdaderos de la magnitud
considerados representativos del mensurando
no es pequeña comparada con la incertidumbre
de la medición, el valor medido es
habitualmente un valor estimado de la media o
de la mediana del conjunto de valores
verdaderos de la magnitud."),
h4("NOTA 4 En la GUM, los términos 'resultado
de medición' y 'estimado del valor del
mensurando', o incluso 'estimado del
mensurando', se utilizan en el sentido de 'valor
medido de la magnitud'."),

                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Valorverdaderodeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Valor verdadero de una magnitud:"),
                   h4("Valor de una magnitud compatible con la
definición de la magnitud"), tags$hr(),
                   h4("NOTA 1 En el enfoque basado en el concepto
de Error, el valor verdadero de la magnitud se
considera único y, en la práctica, imposible de
conocer. El enfoque basado en el concepto de
Incertidumbre, consiste en reconocer que,
debido a la inherentemente incompleta cantidad
de detalles en la definición de una magnitud, no
existe un único valor verdadero compatible con
la definición, sino más bien un conjunto de
valores verdaderos compatibles con ella. Sin
embargo, este conjunto de valores es, en
principio y en la práctica, imposible de conocer.
Otros enfoques no contemplan el concepto de
valor verdadero de una magnitud y se apoyan
más bien en el concepto de compatibilidad
metrológica de resultados de medición para
evaluar la validez de los resultados de
medición."),
h4("NOTA 2 En el caso especial de las constantes
fundamentales se considera que la magnitud
tiene un único valor verdadero."),
h4("NOTA 3 Cuando la incertidumbre debida a
la definición del mensurando se considere
despreciable con respecto a las otras
componentes de la incertidumbre de
medición, puede considerarse que el
mensurando tiene un valor verdadero
“esencialmente único”. Éste es el enfoque de la
GUM , en la cual el término 'verdadero' se
considera redundante."),

                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Valorconvencionaldeunamagnitud = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Valor convencional de una magnitud:"),
                   h4("Valor asignado a una magnitud, mediante un
acuerdo, para un determinado propósito"), tags$hr(),
                   h4("NOTA 1 Habitualmente se utiliza para este
concepto el término 'valor convencionalmente
verdadero', aunque no se aconseja su uso."),
h4("NOTA 2 Algunas veces, un valor convencional
es un estimado de un valor verdadero."),
                                     h4("NOTA 3 Un valor convencional se considera
generalmente asociado a una incertidumbre
de medición convenientemente pequeña, que
podría ser considerada nula."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Exactituddeunamedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Exactitud de una medición:"),
                   h4("Grado de concordancia entre un valor medido
y un valor verdadero de un mensurando."), tags$hr(),
                   h4("NOTA 1 El concepto 'exactitud de medición'
no es una magnitud y no se expresa
numéricamente. Se dice que una medición es
más exacta cuanto más pequeño es el error de
medición."),
h4("NOTA 2 El término 'exactitud de medición' no
debe utilizarse en lugar de 'veracidad de
medición', al igual que el término 'precisión
de medición' tampoco debe utilizarse en lugar
de 'exactitud de medición', ya que este último
término incluye ambos conceptos.")
h4("NOTA 3 La exactitud de medición se
interpreta a veces como el grado de
concordancia entre los valores medidos
atribuidos al mensurando."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Veracidaddemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Veracidad de medición:"),
                   h4("Grado de concordancia entre la media de un
número infinito de valores medidos repetidos y
un valor de referencia."), tags$hr(),
                   h4("NOTA 1 La veracidad de medición no es una
magnitud y no puede expresarse numéricamente, aunque la norma ISO 5725
especifica formas de expresar dicho grado de
concordancia."),
h4("NOTA 2 La veracidad de medición está
inversamente relacionada con el error
sistemático, pero no está relacionada con el
error aleatorio."),
h4("NOTA 3 No debe utilizarse el término
'exactitud de medición' en lugar de
'veracidad de medición'."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Precisiondemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Precisión de medición:"),
                   h4("Grado de concordancia entre las indicaciones
o los valores medidos obtenidos en
mediciones repetidas de un mismo objeto, o
de objetos similares, bajo condiciones
especificadas."), tags$hr(),
                   h4("NOTA 1 Es habitual que la precisión de una
medición se exprese numéricamente mediante
medidas de dispersión tales como la desviación
estándar, la varianza o el coeficiente de
variación bajo las condiciones especificadas."),
h4("NOTA 2 Las 'condiciones especificadas'
pueden ser, por ejemplo, condiciones de
repetibilidad, condiciones de precisión
intermedia, o condiciones de
reproducibilidad."),
h4("NOTA 3 La precisión se utiliza para definir la
repetibilidad de medición, la precisión
intermedia y la reproducibilidad."),
 h4("NOTA 4  Algunas veces, 'precisión de medición'
se utiliza, erróneamente, en lugar de “exactitud
de medición”."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Errordemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Error de medición:"),
                   h4("Valor medido de una magnitud menos un
valor de referencia."), tags$hr(),
                   h4("NOTA 1 El concepto de error de medición
puede emplearse cuando exista un único valor de
referencia, como en el caso de realizar
una calibración mediante un patrón
cuyo valor medido tenga una incertidumbre de medición
despreciable, o cuando se toma un
valor convencional, en cuyo caso el
error de medición es conocido, o bien, cuando el mensurando se supone
representado por un valor verdadero único o
por un conjunto de valores verdaderos, de
amplitud despreciable, en cuyo caso el error
de medición es desconocido."),
h4("NOTA 2 Conviene no confundir el error de
medición con un error en la producción o con
un error humano."),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Errorsistematicodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Error sistemático de medición:"),
                   h4("Componente del error de medición que, en
mediciones repetidas, permanece constante o
varía de manera predecible."), tags$hr(),
                   h4("NOTA 1 El valor de referencia para un error
sistemático es un valor verdadero, un valor
medido de un patrón cuya incertidumbre de
medición es despreciable, o un valor
convencional."),
h4("NOTA 2 El error sistemático y sus causas
pueden ser conocidas o no. Para compensar un
error sistemático conocido puede aplicarse una
corrección."),
  h4("NOTA 3 El error sistemático es igual al error
de medición menos el error aleatorio."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Sesgodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Sesgo de medición:"),
                   h4("Valor estimado de un error sistemático"), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Erroraleatoriodemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Error aleatorio de medición:"),
                   h4("Componente del error de medición que, en
mediciones repetidas, varía de manera
impredecible."), tags$hr(),
                   h4("NOTA 1  El valor de referencia para un error
aleatorio es la media que se obtendría de un
número infinito de mediciones repetidas del
mismo mensurando."),
h4("NOTA 2 Los errores aleatorios de un conjunto
de mediciones repetidas forman una
distribución que puede representarse por su
esperanza matemática, generalmente asumida
como nula, y por su varianza."),
                               h4("NOTA 3 El error aleatorio es igual al error de
medición menos el error sistemático."),
  p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Condicionderepitibilidaddeunamedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Condición de repitibilidad de una medición:"),
                   h4("Condición de medición, dentro de un conjunto
de condiciones que incluye el mismo
procedimiento de medición, los mismos
operadores, el mismo sistema de medición,
las mismas condiciones de operación y el
mismo lugar, así como mediciones repetidas
del mismo objeto o de un objeto similar en un
periodo corto de tiempo."), tags$hr(),
                   h4("NOTA 1 Una condición de medición es una
condición de repetibilidad únicamente respecto
a un conjunto dado de condiciones de
repetibilidad."),
h4("NOTAS 2 En química, el término 'condición de
precisión intra-serie' se utiliza algunas veces
para referirse a este concepto."),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Repitibilidaddemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Repitibidad de medición:"),
                   h4("Precisión de medición bajo un conjunto de condiciones de repetibilidad."), tags$hr(),
     p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Condiciondeprecisionintermediadeunamedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Condición de precisión intermedia de una medición:"),
                   h4("Condición de medición, dentro de un conjunto
de condiciones que incluye el mismo
procedimiento de medición, el mismo lugar y
mediciones repetidas del mismo objeto u
objetos similares durante un periodo amplio de
tiempo, pero que puede incluir otras
condiciones que involucren variaciones."), tags$hr(),
                   h4("NOTA 1  Las variaciones pueden comprender
nuevas calibraciones, patrones, operadores y
sistemas de medición."),
h4("NOTA 2 Conviene que, en la medida de lo
posible, una especificación sobre las
condiciones indique qué condiciones cambiaron
y cuáles no."),
h4("NOTA 3 En química, el término 'condición de
precisión inter-serie' se utiliza algunas veces
para referirse a este concepto."),

                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Precisionintermediademedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Precisión intermedia de medición:"),
                   h4("Precisión de medición bajo un conjunto de
condiciones de precisión intermedia."), tags$hr(),
                   h4("NOTA 1 En la norma ISO 5725-3:1994 se dan
los términos estadísticos pertinentes."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Condiciondereproducibilidaddeunamedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Condición de reproducibilidad de una medición:"),
                   h4("Condición de medición, dentro de un conjunto
de condiciones que incluye diferentes lugares,
operadores, sistemas de medición y
mediciones repetidas de los mismos objetos u
objetos similares."), tags$hr(),
                   h4("NOTA 1 Los diferentes sistemas de medición
pueden utilizar diferentes procedimientos de
medición."),
h4("NOTA 2 Conviene que, en la medida de lo
posible, una especificación sobre las
condiciones indique qué condiciones cambiaron
y cuáles no."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Reproducibilidaddemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Reproducibilidad de medición:"),
                   h4("Precisión de medición bajo un conjunto de
condiciones de reproducibilidad."), tags$hr(),
                   h4("NOTA 1 En las normas ISO 5725-1:1994 e ISO
5725-2:1994 se dan los términos estadísticos
pertinentes."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbredemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre de medición:"),
                   h4("Parámetro no negativo que caracteriza la
dispersión de los valores atribuidos a un
mensurando, a partir de la información que se
utiliza."), tags$hr(),
                   h4("NOTA 1  La incertidumbre de medición incluye
componentes procedentes de efectos
sistemáticos, tales como componentes
asociadas a correcciones y a valores
asignados a patrones, así como la
incertidumbre debida a la definición. Algunas
veces no se corrigen los efectos sistemáticos
estimados y en su lugar se tratan como
componentes de incertidumbre."),
h4("NOTA 2 El parámetro puede ser, por ejemplo,
una desviación estándar , en cuyo caso se
denomina incertidumbre estándar de
medición (o un múltiplo de ella), o el
semiancho de un intervalo con una
probabilidad de cobertura determinada."),
h4("NOTA 3 En general, la incertidumbre de
medición incluye numerosas componentes.
Algunas pueden calcularse mediante una
evaluación tipo A de la incertidumbre de
medición, a partir de la distribución estadística
de los valores que proceden de las series de
mediciones y pueden caracterizarse por
desviaciones estándar. Las otras componentes,
que pueden calcularse mediante una
evaluación tipo B de la incertidumbre de
medición, pueden caracterizarse también por
desviaciones estándar, evaluadas a partir de
funciones de densidad de probabilidad basadas
en la experiencia u otra información."),
h4("NOTA 4 En general, para una información
dada, se sobrentiende que la incertidumbre de
medición está asociada a un valor determinado
atribuido al mensurando. Por tanto, una
modificación de este valor supone una
modificación de la incertidumbre asociada."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbredebidaaladefinicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre debida a la definición:"),
                   h4("Componente de la incertidumbre de medición
resultante de la cantidad finita de detalles en la
definición del mensurando."), tags$hr(),
                   h4("NOTA 1 La incertidumbre debida a la definición
es la incertidumbre mínima que puede
alcanzarse en la práctica para cualquier
medición de un mensurando dado."),
h4("NOTA 2 Cualquier modificación de los detalles
descriptivos del mensurando conduce a otra
incertidumbre debida a la definición."),
h4("NOTA 3 En la GUM:1995, D 3.4 y en la IEC
60359, el concepto de incertidumbre debida a la
definición se denomina “incertidumbre
intrínseca”."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbreestandardemedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre estandar de medición:"),
                   h4("Incertidumbre de medición expresada como
una desviación estándar."), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbreestandarcombinadademedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre estandar combinada de medición:"),
                   h4("Incertidumbre estándar obtenida a partir de
las incertidumbres estándares individuales
asociadas a las magnitudes de entrada de un
modelo de medición."), tags$hr(),
                   h4("NOTA 1 Cuando existan correlaciones entre las
magnitudes de entrada en un modelo de
medición, en el cálculo de la incertidumbre
estándar combinada es necesario también
considerar las covarianzas; véase también la
GUM:1995, 2.3.4."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbreestandarrelativademedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre estandar relativa de medición:"),
                   h4("Cociente entre la incertidumbre estándar y el
valor absoluto del valor medido."), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Presupuestodeincertidumbre = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Presupuesto de incertidumbre:"),
                   h4("Declaración de una incertidumbre de
medición, de las componentes de esa incertidumbre y de su cálculo y combinación."), tags$hr(),
                   h4("NOTA 1 En el presupuesto de incertidumbre se
debería incluir el modelo de medición, los
estimados e incertidumbres asociadas a las
magnitudes que intervienen en dicho modelo,
las covarianzas, el tipo de funciones de
densidad de probabilidad consideradas, los
grados de libertad, el tipo de evaluación de la
incertidumbre y cualquier factor de cobertura."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbreobjetivo = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre objetivo:"),
                   h4("Incertidumbre de medición especificada como
un límite superior y elegida en base al uso
previsto de los resultados de medición."), tags$hr(),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Incertidumbreexpandidademedicion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Incertidumbre expandida de medición:"),
                   h4("Producto de una incertidumbre estándar
combinada y un factor mayor que uno."), tags$hr(),
                   h4("NOTA 1 El factor depende del tipo de
distribución de probabilidad de la magnitud de
salida en un modelo de medición y de la
probabilidad de cobertura elegida."),
h4("NOTA 2 El factor que interviene en esta
definición es un factor de cobertura."),
                                       h4("NOTA 3 La incertidumbre expandida se
denomina 'incertidumbre global' en el párrafo 5
de la Recomendación INC-1 (1980) (véase la GUM) y simplemente 'incertidumbre' en los
documentos IEC."),

                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),


Intervalodecobertura = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Intervalo de cobertura:"),
                   h4("Intervalo que contiene el conjunto de valores
verdaderos de un mensurando con una
probabilidad determinada, basada en la
información disponible."), tags$hr(),
                   h4("NOTA 1 El intervalo de cobertura no necesita
estar centrado en el valor medido elegido
(véase JCGM 101:2008)."),
h4("NOTA 2 El intervalo de cobertura no debería
denominarse “intervalo de confianza”, evitando así confusión con el concepto estadístico
(véase la GUM:1995, 6.2.2)."),
h4("NOTA 3 El intervalo de cobertura puede
obtenerse de una incertidumbre expandida
(véase la GUM:1995, 2.3.5)."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Calibracion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Calibración:"),
                   h4("Operación que, bajo condiciones especificadas,
establece en una primera etapa, una relación
entre los valores y sus incertidumbres de
medición asociadas obtenidas a partir de los
patrones de medición, y las correspondientes
indicaciones con sus incertidumbres
asociadas y, en una segunda etapa, utiliza esta
información para establecer una relación que
permita obtener un resultado de medición a
partir de una indicación."), tags$hr(),
                   h4("NOTA 1 Una calibración puede expresarse
mediante una declaración, una función de
calibración, un diagrama de calibración, una
curva de calibración o una tabla de
calibración. En algunos casos, puede consistir
en una corrección aditiva o multiplicativa de la
indicación con su incertidumbre
correspondiente."), 
h4("NOTA 2 Conviene no confundir la calibración
con el ajuste de un sistema de medición, a
menudo llamado incorrectamente
“autocalibración”, ni con una verificación de la
calibración."),
h4("NOTA 3 Frecuentemente se interpreta que
únicamente la primera etapa de esta definición
corresponde a la calibración."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Jerarquiadecalibracion = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Jerarquía de calibración:"),
                   h4("Secuencia de calibraciones desde una
referencia hasta el sistema de medición final,
en la cual el resultado de cada calibración
depende del resultado de la calibración
precedente."), tags$hr(),
                   h4("NOTA 1 La incertidumbre de medición va
aumentando necesariamente a lo largo de la
secuencia de calibraciones."),
h4("NOTA 2 Los elementos de una jerarquía de
calibración son uno o más patrones y sistemas
de medición utilizados según determinados
procedimientos de medición."),
h4("NOTA 3 En esta definición, la referencia
puede ser la definición de una unidad de
medición, a través de su realización práctica, o
un procedimiento de medición o un patrón."),
h4("NOTA 4 La comparación entre dos patrones
de medición puede considerarse como una
calibración si ésta se utiliza para comprobar y,
si procede, corregir el valor y la incertidumbre
atribuida a uno de los patrones."),
                   p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Trazabilidadmetrologica = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Trazabilidad de metrología:"),
                   h4("Propiedad de un resultado de medición por la
cual dicho resultado puede relacionarse con
una referencia mediante una cadena
ininterrumpida y documentada de
calibraciones, cada una de las cuales
contribuye a la incertidumbre de medición."), tags$hr(),
                   h4("NOTA 1 En esta definición, la “referencia”
puede ser la definición de una unidad de
medida, mediante su realización práctica, o un
procedimiento de medición que incluya la
unidad de medida cuando se trate de una
magnitud no ordinal, o un patrón."),
h4("NOTA 2  La trazabilidad metrológica requiere
una jerarquía de calibración establecida."),
h4("NOTA 3 La especificación de la referencia
debe incluir la fecha en la cual se utilizó dicha
referencia, junto con cualquier otra información
metrológica relevante sobre la referencia, tal
como la fecha en que se haya realizado la
primera calibración en la jerarquía."),
h4("NOTA 4  Para mediciones con más de una
magnitud de entrada en el modelo de
medición, cada valor de entrada debiera ser
metrológicamente trazable y la jerarquía de
calibración puede tener forma de estructura
ramificada o de red. El esfuerzo realizado para
establecer la trazabilidad metrológica de cada
valor de entrada debería ser en proporción a su
contribución relativa al resultado de la
medición."),
h4("NOTA 5 La trazabilidad metrológica de un
resultado de medición no garantiza por sí
misma la adecuación de la incertidumbre de
medición a un fin dado, o la ausencia de errores
humanos."),
h4("NOTA 6 La comparación entre dos patrones
de medición puede considerarse como una
calibración si ésta se utiliza para comprobar, y
si procede, corregir el valor y la incertidumbre
atribuidos a uno de los patrones."),
h4("NOTA 7 ILAC consideró que los elementos
necesarios para confirmar la trazabilidad
metrológica son: una cadena ininterrumpida de
trazabilidad metrológica a un patrón de
medición internacional o a un patrón de
medición nacional, una incertidumbre de
medición documentada, un procedimiento de
medición documentado, una competencia
técnica acreditada, la trazabilidad metrológica al
SI y los intervalos entre calibraciones
establecidos (véase ILAC P-10:2002)."),
h4("NOTA 8 Algunas veces el término abreviado
'trazabilidad' se utiliza en lugar de 'trazabilidad
metrológica' así como para otros conceptos,
como trazabilidad de una muestra, de un
documento, de un instrumento, de un material,
etc., cuando interviene el historial ('traza') del
elemento en cuestión. Por tanto, es preferible
utilizar el término completo “trazabilidad metrológica si hay algún riesgo de confusión"),
 p(style = "text-align: rigth;", "Vocabulario Internacional de Metrología, [JCMG, 2012]")),

Cadenadetrazabilidadmetrologica = box(width = 12, solidHeader = FALSE, status = 'primary',
                   title = tags$b("Cadena de trazabilidad metrológica:"),
                   h4("Sucesión de patrones y calibraciones que
relacionan un resultado de medición con una
referencia "), tags$hr(),
                   h4("NOTA 1 Una cadena de trazabilidad
metrológica se define mediante una jerarquía
de calibración."),
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
