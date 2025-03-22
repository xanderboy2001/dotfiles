from libqtile.dgroups import simple_key_binder
from libqtile.config import Key, Group, ScratchPad, DropDown, Match
from libqtile.lazy import lazy
from settings.keys import mod, keys


scratchpad_conf = {"opacity": 0.95, 
                   "height": 0.8, "width": 0.8,
                   "x":0.1, "y":0.1,
                   "on_focus_lost_hide": True, "warp_pointer": True}

groups = [

        Group(name="1", label="  ", layout="monadtall"),
        Group(name="2", label="  ", layout="treetab"),
        Group(name="3", label="  ", layout="monadtall"),
        Group(name="4", label="  ", layout="max"),
        Group(name="5", label=" 󰓓 ", layout="max"),
        Group(name="6", label=" 󰇮 ", layout="max"),
        Group(name="7", label=" 7 ", layout="treetab"),
        Group(name="8", label="  ", layout="max"),
        Group(name="9", label=" 󰚯 ", layout="monadtall"),
        ScratchPad("scratchpad", [
            # define a drop down terminal
            # placed in upper third of screen by default
            DropDown("term",
                     "alacritty",
                     **scratchpad_conf),
            DropDown("music",
                     "cider",
                     **scratchpad_conf),
            DropDown("ranger",
                     "alacritty -e ranger",
                     **scratchpad_conf),
            DropDown("tgpt",
                     "alacritty -e tgpt -i",
                     **scratchpad_conf),
            ])
        ]


for i in groups[0:9]:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key([mod, 'shift'], i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )
