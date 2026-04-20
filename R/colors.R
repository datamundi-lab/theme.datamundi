# ============================================================
#  Paleta de cores DataMundi
# ============================================================

#' Cores da identidade visual DataMundi
#'
#' Vetor nomeado com as cores institucionais do laboratório.
#'
#' @format Um vetor character com sete elementos nomeados:
#' \describe{
#'   \item{primary}{`#002224` — Ciano escuro (fundo dark)}
#'   \item{secondary}{`#E8FF00` — Amarelo-ciano vibrante}
#'   \item{accent}{`#F5A623` — Laranja âmbar}
#'   \item{highlight}{`#E84855` — Vermelho coral}
#'   \item{neutral}{`#002224` — Alias de primary}
#'   \item{dark}{`#0D1B2A` — Quase-preto naval}
#'   \item{light}{`#F4F7FB` — Fundo off-white}
#' }
#' @export
datamundi_colors <- c(
  primary   = "#002224",
  secondary = "#E8FF00",
  accent    = "#F5A623",
  highlight = "#E84855",
  neutral   = "#002224",
  dark      = "#0D1B2A",
  light     = "#F4F7FB"
)

#' Retorna uma cor DataMundi pelo nome
#'
#' @param name Character. Um dos nomes em [datamundi_colors]:
#'   `"primary"`, `"secondary"`, `"accent"`, `"highlight"`,
#'   `"neutral"`, `"dark"`, `"light"`.
#' @return String hex sem nome.
#' @examples
#' dm_color("secondary")   # "#E8FF00"
#' dm_color("accent")      # "#F5A623"
#' @export
dm_color <- function(name) unname(datamundi_colors[name])

#' Gera um vetor de cores DataMundi
#'
#' @param n Inteiro. Número de cores desejado.
#' @param type Character. `"discrete"` (padrão) ou `"continuous"`.
#' @return Vetor character de cores hex.
#' @examples
#' dm_palette(3)
#' dm_palette(100, type = "continuous")
#' @export
dm_palette <- function(n, type = "discrete") {
  core <- unname(datamundi_colors[c("secondary", "accent", "highlight",
                                    "primary", "neutral")])
  if (type == "discrete") {
    if (n <= length(core)) return(core[seq_len(n)])
    grDevices::colorRampPalette(core)(n)
  } else {
    grDevices::colorRampPalette(c(
      dm_color("primary"),
      dm_color("secondary"),
      dm_color("accent")
    ))(n)
  }
}
