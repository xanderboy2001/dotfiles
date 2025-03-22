#from libqtile import widget
from libqtile.lazy import lazy
from settings.theme import colors
from settings.functions import show_power_menu
from qtile_extras import widget


def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
            **base(fg, bg), text="", fontsize=43, padding=-3
    )


def workspaces():
    return [
            separator(),
            widget.GroupBox(
                **base(fg="light"),
                font="SauceCodePro Nerd Font Mono",
                fontsize=22,
                margin_y=3,
                margin_x=0,
                padding_y=0,
                padding_x=3,
                borderwidth=1,
                active=colors["active"],
                inactive=colors["inactive"],
                rounded=False,
                highlight_method="block",
                urgent_alert_method="block",
                ugent_border=colors["urgent"],
                this_current_screen_border=colors["focus"],
                this_screen_border=colors["grey"],
                other_current_screen_border=colors["dark"],
                other_screen_border=colors["dark"],
                disable_drag=True,
            ),
            separator(),
            widget.WindowName(**base(fg="focus"), fontsize=15, padding=5),
    ]


def status(pre, service):
    return widget.UnitStatus(
            **base(fg='light'),
            label=pre,
            unitname=service,
            padding=5,
            mouse_callbacks={
                "Button1": lazy.spawn('sudo systemctl start '+service),
                "Button3": lazy.spawn('sudo systemctl stop '+service),
            }
           )


primary_widgets = [
        *workspaces(),
        separator(),
        widget.CurrentLayout(**base(fg='light'), padding=5),
        widget.Clock(**base(fg="light"), format="%A %m/%d/%Y - %I:%M %p "),
        widget.Systray(background=colors["dark"], padding=5),
]


secondary_widgets = [
        *workspaces(),
        separator(),
        widget.CurrentLayoutIcon(**base(fg='light'), padding=5),
        widget.Clock(**base(bg='dark', fg='light'), format='%I:%M:%S %P '),
]


widget_defaults = {
        "font": "SauceCodePro Nerd Font",
        "fontsize": 14,
        "padding": 1,
}
extension_defaults = widget_defaults.copy()
