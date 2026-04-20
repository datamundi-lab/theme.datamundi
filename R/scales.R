# ============================================================
#  Escalas ggplot2 DataMundi
# ============================================================

#' Escala de cor discreta DataMundi
#'
#' @param ... Argumentos repassados a [ggplot2::scale_color_manual()].
#' @export
scale_color_datamundi <- function(...) {
  ggplot2::scale_color_manual(values = dm_palette(8), ...)
}

#' Escala de preenchimento discreta DataMundi
#'
#' @param ... Argumentos repassados a [ggplot2::scale_fill_manual()].
#' @export
scale_fill_datamundi <- function(...) {
  ggplot2::scale_fill_manual(values = dm_palette(8), ...)
}

#' Escala de preenchimento contínua DataMundi
#'
#' Gradiente de `primary` → `secondary` → `accent`.
#'
#' @param ... Argumentos repassados a [ggplot2::scale_fill_gradientn()].
#' @export
scale_fill_datamundi_c <- function(...) {
  ggplot2::scale_fill_gradientn(
    colours = c(dm_color("primary"), dm_color("secondary"), dm_color("accent")),
    ...
  )
}
