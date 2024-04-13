from libqtile.dgroups import simple_key_binder
from libqtile.config import Key, Group, ScratchPad, DropDown, Match
from libqtile.command import lazy
from settings.keys import mod, keys


gamesList = [
        Match(wm_class=[
                        "retroarch",
                        "Minecraft* 1.20.1",
                        "Minecraft* 1.19.2",
                        "Minecraft* 1.18.2",
                        "Minecraft* 1.16.5",
                        "Better MC [FABRIC] 1.20.1",
                        "Prominence II [FABRIC] 1.20.1",
                        ]),
        Match(title=["Assassin’s Creed® Odyssey",
                     "Besiege"
                     "Binding of Isaac: Afterbirth+",
                     "Cities: Skylines",
                     "Cuphead",
                     "Fallout 4",
                     "Grand Theft Auto V",
                     "Hades",
                     "No Man's Sky",
                     "RocketLeague",
                     "Skyrim Special Edition",
                     "Stardew Valley",
                     "UNDERTALE",
                     "shapez",
                     "Totally Accurate Battle Simulator"])
    ]
gameLaunchers = [
        Match(wm_class=[
                "Paradox Launcher", "PolyMC", "Lutris", "skyve.exe", "steam",
            ]),
        Match(title=[
            "Link2EA", "EA app installer", "Rockstar Games Launcher", "Rockstar Games Launcher Installer",
            ])
    ]

scratchpad_conf = {"opacity": 0.95, 
                   "height": 0.8, "width": 0.8,
                   "x":0.1, "y":0.1,
                   "on_focus_lost_hide": True, "warp_pointer": True}

groups = [

        Group(name="1", label="  ", layout="monadtall", matches=[Match(wm_class=["Unity", "code-oss", "godot"])]),
        Group(name="2", label="  ", layout="treetab", matches=[Match(wm_class=["firefox"])]),
        Group(name="3", label="  ", layout="monadtall", matches=[Match(wm_class=["libreoffice-writer", "libreoffice", "loffice"])]),
        Group(name="4", label="  ", layout="max", matches=gamesList),
        Group(name="5", label=" 󰓓 ", layout="max", matches=gameLaunchers),
        Group(name="6", label=" 󰇮 ", layout="max", matches=[Match(wm_class=["thunderbird"])]),
        Group(name="7", label=" 7 ", layout="treetab", matches=[Match(wm_class=["virt-manager", "virt-viewer", "Vmware-view"])]),
        Group(name="8", label="  ", layout="max", matches=[Match(wm_class=["gpclient", "Cisco AnyConnect Secure Mobility Client"])]),
        Group(name="9", label=" 󰚯 ", layout="monadtall", matches=[Match(wm_class=["Anydesk", "unityhub"])]),
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
