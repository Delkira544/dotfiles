from libqtile import widget

# Variables de personalizacion de barra
fuente_predeterminada="Ubuntu Mono Nerd Font"
tamano_fuente=14

widget_defaults = dict(
    font=fuente_predeterminada,
    fontsize=tamano_fuente,
    padding=0,
)

extension_defaults = widget_defaults.copy()
