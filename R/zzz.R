# ============================================================
#  Inicialização do pacote
# ============================================================

.onLoad <- function(libname, pkgname) {
  sysfonts::font_add_google("Montserrat", "montserrat")
  sysfonts::font_add_google("Fira Code",  "fira_code")
  sysfonts::showtext_auto()
}
