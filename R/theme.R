# ============================================================
#  Tema principal DataMundi
# ============================================================

#' Define os defaults de geoms para o modo escuro
#'
#' Aplica `#E8FF00` como cor padrão para pontos, linhas, barras de erro
#' e segmentos. **Efeito global na sessão R** — chame novamente com
#' `color = "black"` se precisar reverter.
#'
#' @param color Hex da cor a aplicar. Padrão: `"#E8FF00"`.
#' @export
dm_set_geom_defaults <- function(color = "#E8FF00") {
  ggplot2::update_geom_defaults("point",     list(color = color))
  ggplot2::update_geom_defaults("line",      list(color = color))
  ggplot2::update_geom_defaults("path",      list(color = color))
  ggplot2::update_geom_defaults("errorbar",  list(color = color))
  ggplot2::update_geom_defaults("errorbarh", list(color = color))
  ggplot2::update_geom_defaults("segment",   list(color = color))
  invisible(NULL)
}

#' Tema ggplot2 DataMundi
#'
#' Tema minimalista com identidade visual do laboratório DataMundi,
#' otimizado para exportação em redes sociais (1080×1080 px).
#'
#' @param base_size Tamanho base da fonte em pt. Padrão: `14`.
#' @param dark_mode Logical. `TRUE` (padrão) usa fundo ciano escuro;
#'   `FALSE` usa fundo off-white.
#' @param grid Grade de referência: `"horizontal"`, `"vertical"`,
#'   `"both"` ou `"none"` (padrão).
#' @param legend_pos Posição da legenda. Padrão: `"bottom"`.
#'
#' @return Objeto `theme` do ggplot2.
#'
#' @details
#' Em `dark_mode = TRUE`, chama [dm_set_geom_defaults()] internamente,
#' definindo `#E8FF00` como cor padrão de pontos, linhas e barras de erro.
#' Esse efeito é global na sessão R.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() +
#'   theme_datamundi()
#' }
#' @export
theme_datamundi <- function(
    base_size  = 14,
    dark_mode  = TRUE,
    grid       = "none",
    legend_pos = "bottom"
) {

  bg          <- if (dark_mode) "#002224" else dm_color("light")
  panel       <- if (dark_mode) "#004448" else "#FFFFFF"
  text        <- if (dark_mode) "#E8FF00" else dm_color("dark")
  grid_col    <- if (dark_mode) "#002224" else "#DDE6EE"
  caption_col <- if (dark_mode) "#E8FF00" else "#8A9EAF"

  if (dark_mode) dm_set_geom_defaults()

  grid_h <- if (grid %in% c("horizontal", "both"))
    ggplot2::element_line(color = grid_col, linewidth = 0.4, linetype = "dashed")
  else
    ggplot2::element_blank()

  grid_v <- if (grid %in% c("vertical", "both"))
    ggplot2::element_line(color = grid_col, linewidth = 0.4, linetype = "dashed")
  else
    ggplot2::element_blank()

  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      # Fundo
      plot.background  = ggplot2::element_rect(fill = bg,    color = NA),
      panel.background = ggplot2::element_rect(fill = panel, color = NA),

      # Títulos
      plot.title = ggplot2::element_text(
        family = "montserrat", face = "bold",
        size   = base_size * 1.5, color = text,
        margin = ggplot2::margin(b = 1), hjust = 0
      ),
      plot.subtitle = ggplot2::element_text(
        family = "montserrat",
        size   = base_size * 0.95, color = caption_col,
        margin = ggplot2::margin(b = 1), hjust = 0
      ),
      plot.caption = ggplot2::element_text(
        family = "fira_code",
        size   = base_size * 0.65, color = caption_col,
        hjust  = 1, margin = ggplot2::margin(t = 1)
      ),

      # Eixos
      axis.title = ggplot2::element_text(
        family = "montserrat", face = "bold",
        size   = base_size, color = caption_col
      ),
      axis.text  = ggplot2::element_text(
        family = "montserrat",
        size   = base_size, color = caption_col
      ),
      axis.line  = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),

      # Grade
      panel.grid.major.y = grid_h,
      panel.grid.major.x = grid_v,
      panel.grid.minor   = ggplot2::element_blank(),

      # Legenda
      legend.position   = legend_pos,
      legend.background = ggplot2::element_rect(fill = bg, color = NA),
      legend.key        = ggplot2::element_rect(fill = bg, color = NA),
      legend.text       = ggplot2::element_text(
        family = "montserrat", size = base_size * 0.8, color = text
      ),
      legend.title      = ggplot2::element_text(
        family = "montserrat", face = "bold",
        size   = base_size * 0.85, color = text
      ),

      # Facets
      strip.background = ggplot2::element_rect(
        fill = dm_color("primary"), color = NA
      ),
      strip.text = ggplot2::element_text(
        family = "montserrat", face = "bold",
        size   = base_size, color = "#E8FF00"
      ),

      # Margens
      plot.margin = ggplot2::margin(5, 5, 5, 5)
    )
}
