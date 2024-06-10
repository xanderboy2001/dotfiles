from libqtile import layout
from libqtile.config import Match
from settings.theme import colors

# Layouts and layout rules
layout_conf = {"border_focus": colors["focus"][0], "border_normal": colors["inactive"][0], "border_width": 2, "margin": 4, "single_border_width": 0, "single_margin": 0}
layouts = [
    layout.MonadTall(**layout_conf),
    layout.TreeTab(
        font = "SauceCodePro Nerd Font",
        fontsize=12,
        sections = [""],
        section_fontsize = 11,
        bg_color = "282a36",
        active_bg = "44475a",
        active_fg = "f8f8f2",
        inactive_bg = "282a36",
        inactive_fg = "6272a4",
        padding_y = 5,
        section_top = 10,
        panel_width = 150,
        **layout_conf
        ),
    layout.Max(**layout_conf),
    layout.Floating(**layout_conf)
 ]  

# Rules for floating layouts

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(title="branchdialog"),Match(title="pinentry")
    ]
)
