geom_function <- function(mapping = NULL, data = NULL, stat = "function",
                          position = "identity", ..., na.rm = FALSE,
                          show.legend = NA, inherit.aes = TRUE) {
  if (is.null(data)) {
    data <- ensure_nonempty_data
  }
  
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomFunction,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
#' @include geom-path.r
GeomFunction <- ggproto("GeomFunction", GeomPath,
                        draw_panel = function(self, data, panel_params, coord, arrow = NULL,
                                              lineend = "butt", linejoin = "round", linemitre = 10,
                                              na.rm = FALSE) {
                          groups <- unique(data$group)
                          if (length(groups) > 1) {
                            warn("Multiple drawing groups in `geom_function()`. Did you use the correct `group`, `colour`, or `fill` aesthetics?")
                          }
                          
                          ggproto_parent(GeomPath, self)$draw_panel(
                            data, panel_params, coord, arrow, lineend, linejoin, linemitre, na.rm
                          )
                        }
)