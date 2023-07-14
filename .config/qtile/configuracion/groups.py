# Import de las librerias de qtile
from libqtile.config import Key, Group
from libqtile.command import lazy

# Import de la configuracion de las teclas de qtile
from .keys import mod, keys


# Aqui sew agrupan los nombre de los escritorios en la barra de navegacion
# Lista de Iconos
# 1.Archlinux
# 2.Navegador
# 3.
# 4.
# 5.
# 6.
# 7. nf-mdi-discord
# 8.
# 9.

# Configuracion correspondiente a las teclas
"""groups = [Group(i) for i in [
    " ", " ", " ", "  ", " ", "  ", " 󰙯  ", "   ", " 󰍹  ",
]]

for i, group in enumerate(groups):
    numEscritorio = str(i+1)
    keys.extend(
        [
            Key(
                [mod],
                numEscritorio,
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),

            Key(
                [mod, "shift"],
                numEscritorio,
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    group.name),
            ),
        ]
    )
"""

groups = []
group_names = ["WWW","DEV","SYS","DOC","CHAT","VBOX","VID","MUS","GFX"]
keynames = [i for i in "123456789"]
group_labels = [" ", " ", " ", " ", " ", " ", "󰙯 ", " ", "󰍹 ",]
for g in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[g],
            label=group_labels[g],
        )
    )

for keyname, group in zip(keynames, groups):
    keys.extend([
        Key([mod], keyname, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], keyname, lazy.window.togroup(group.name)),
    ])



