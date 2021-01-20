pround <- function (x, digits = 5) {
  if (round(x, digits) == 0) {
    return(paste0('< 1 e-0', digits))
  } else {
  	return(round(x, digits))
  }
}
