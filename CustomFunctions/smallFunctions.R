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

