from libqtile.config import Screen
from libqtile import widget
from libqtile import bar
from qtile_extras import widget as widget2
from qtile_extras.widget.decorations import BorderDecoration, PowerLineDecoration
from .color import colors as color


# Variables
tamano_barra = 24


def SoloNombre(text):
    partesTexto = text.split("-")
    return partesTexto[2]


#
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(10),
                widget.GroupBox(
                    active=color[15][0],
                    center_aligned=True,
                    highlight_method="line",
                    highlight_color=[color[11][0], color[3][0]],
                    inactive=color[14][0],
                    scroll_delay=2,
                    padding_x=10,
                ),
                # widget.Prompt(fontsize=1, colour = color[0][0]),
                widget.Spacer(40),
                widget.WindowName(
                    format='{state}{name}',
                    foreground=color[4],
                    parse_text=SoloNombre,
                    decorations = [
                        BorderDecoration(
                               colour = color[6],
                               border_width = [0, 0, 2, 0],
                               padding_x = 5,
                               padding_y = None,
                           )
                    ]
                ),

                # widget.Chord(
                #    chords_colors={
                #        "launch": ("#ff0000", "#ffffff"),
                #    },
                #    name_transform=lambda name: name.upper(),
                # ),
                widget.Pomodoro(
                    background=color[1],

                ),

                # widget.CheckUpdates(
                #    distro = "Arch",
                # ),
                # widget.NvidiaSensors(),
                widget.Memory(
                    background=color[1],
                    margin=0,
                    padding_x=5,
                ),

                widget2.ALSAWidget(
                    background=color[1][0],
                    mode="icon",
                    hide_interval=5,
                    theme_path="/home/yostin/Imágenes/iconos/",
                ),
                # widget2.BrightnessControl(),
                widget.Systray(
                    background=color[1],
                ),
                widget.Clock(
                    background=color[1],
                    format="%Y-%m-%d %a %I:%M %p"
                ),
                # widget.QuickExit(),
                # widget.CurrentLayout(),
                # widget2.UPowerWidget()
                widget.CurrentLayoutIcon(
                    background=color[1],
                    padding=4,
                    fontsize=1,
                    scale=0.75,
                ),

            ],
            tamano_barra,
            background=color[0][0],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]
