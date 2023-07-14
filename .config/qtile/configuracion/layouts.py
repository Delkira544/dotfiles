from libqtile import layout
from libqtile.config import Match
from .color import colors as color


layouts = [
    #layout.Columns(border_focus_stack=[color[3][0], color[5][0]], border_width=4),
    layout.MonadTall(
        border_normal="#222222",
        border_focus=color[1],
        border_width=2,
        single_border_width=0,
        margin=4,
        single_margin=4,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    #layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    #  layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

