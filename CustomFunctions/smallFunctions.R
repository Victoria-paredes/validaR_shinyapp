pround <- function (x, digits = 5) {
  if (round(x, digits) == 0) {
    return(paste0('< 1 e-0', digits))
  } else {
  	return(round(x, digits))
  }
}

seedNorm <- function (n = 500, mean = 0, sd = 1, seed = 0) {
  set.seed(seed)
  return(rnorm(n = n, mean = mean, sd = sd))
}

CNTR <- function(x) {
  return(#tags$span(style = "align: center;", x)
    column(12, align="center", x))}

cnclsn <- function(x, y = 'ref'){
  
  if(y == 'ref') {
    if (x == 'two.sided') return('es diferente del valor de referencia.')
    if (x == 'less')      return('es menor al valor de referencia.')
    if (x == 'greater')   return('es mayor al valor de referencia.')
  } else {
    if (x == 'two.sided') return('es diferente de la del segundo grupo.')
    if (x == 'less')      return('es menor de la del segundo grupo.')
    if (x == 'greater')   return('es mayor de la del segundo grupo.')
  }
}