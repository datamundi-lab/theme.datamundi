# ============================================================
#  Inicialização do pacote
# ============================================================

.onLoad <- function(libname, pkgname) {
  showtext::font_add_google("Montserrat", "montserrat")
  showtext::font_add_google("Fira Code",  "fira_code")
  showtext::showtext_auto()
}
