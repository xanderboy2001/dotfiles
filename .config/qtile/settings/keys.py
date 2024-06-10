from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from settings.path import *
from settings.functions import *
from os import path

# Rofi Commands
ROFI_WINDOW_SWITCHER_CMD="rofi -show window -modi window -window-matching-fields desktop -filter -ScratchPad -show-icons -window-prefer-icon-theme true -theme-str 'inputbar { enabled: false; } listview { fixed-height: false; }'"
ROFI_CALC_CMD="rofi -show calc -modi calc -no-show-match -no-sort -theme-str 'inputbar { enabled: false; } listview { fixed-height: false; }'"
#entry { placeholder: Calculate; }'"

mod="mod4"

# KEY_CHORDS
SCRATCHPAD_CHORD=KeyChord(
        [mod], "s", [
            Key([], "t",
                lazy.group['scratchpad'].dropdown_toggle('term'),
                desc='Toggle terminal ScratchPad'
                ),
            Key([], "m",
                lazy.group['scratchpad'].dropdown_toggle('music'),
                desc='Toggle Cider ScrathPad'
                ),
            Key([], "c",
                lazy.group['scratchpad'].dropdown_toggle('tgpt'),
                desc='Toggle tgpt ScratchPad'
                ),
            Key([], "r",
                lazy.group['scratchpad'].dropdown_toggle('ranger'),
                desc='Toggle Ranger ScratchPad'
                ),
        ])
ROFI_CHORD=KeyChord(
        [mod], "r", [
            Key([], "h",
                lazy.spawn("dm-hub -r"),
                desc="Spawn dmscripts Hub (in Rofi)"
                ),
            Key([], "a",
                lazy.spawn("dm-pipewire-out-switcher -r"),
                desc="Spawn dmscript to change audio output (in Rofi)"
                ),
            Key([], "b",
                lazy.spawn("dm-bookman-brave -r"),
                desc="Spawn dmbookman Brave (in Rofi)"
                ),
            KeyChord([], "c", [
                # The following are a chain of keys. For example,
                # to launch the dmscripts config editor, you
                # press 'mod' + c + e
                Key([], "a",
                    lazy.spawn(ROFI_CALC_CMD),
                    desc="Spawn a calculator in Rofi"
                    ),
                Key([], "e",
                    lazy.spawn("dm-confedit -r"),
                    desc="Spawn dmscripts config editor (in Rofi)"
                    ),
                Key([], "p",
                    lazy.spawn("dm-colpick -r"),
                    desc="Spawn dmscripts color picker (in Rofi)"
                    ),
                ]),
            KeyChord([], "d", [
                # This is another key chain, same as above
                Key([], "i",
                    lazy.spawn("dm-dictionary -r"),
                    desc="Spawn dmscripts dictionary (in Rofi)"
                    ),
                Key([], "o",
                    lazy.spawn("dm-documents -r"),
                    desc="Spawn dmscripts documents browser (in Rofi)"
                    ),
                ]),
            Key([], "i",
                lazy.spawn("dm-ip -r"),
                desc="Spawn dmscript to get ip (in Rofi)"
                ),
            Key([], "k",
                lazy.spawn("dm-kill -r"),
                desc="Spawn dmscript to kill process (in Rofi)"
                ),
            Key([], "n",
                lazy.spawn("dm-note -r"),
                desc="Spawn dmscript to take quick notes (in Rofi)"
                ),
            Key([], "u",
                lazy.spawn("dm-usbmount -r"),
                desc="Spawn dmscript to mount usb drives (in Rofi)"
                ),
            Key(["shift"], "u",
                lazy.spawn("dm-usbmount -R"),
                desc="Spawn dmscript to unmount usb drives (in Rofi)"
                ),
            Key([], "w",
                lazy.spawn("dm-websearch -r"),
                desc="Spawn dmscript to search the web (in Rofi)"
                ),
            ])

# START_KEYS
keys = [
    ### The essentials
    Key(["control", "mod1"], "Delete",
        lazy.spawn("/home/alex/.config/rofi/powermenu/type-2/powermenu.sh"),
        desc="Run Rofi power menu."
        ),
    Key([mod], "Return",
        lazy.spawn('alacritty'),
        desc='Launch terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn("/home/alex/.config/rofi/launchers/type-3/launcher.sh"),
        desc='Run Rofi Launcher'
        ),
    ### ScratchPads
    SCRATCHPAD_CHORD,
    ROFI_CHORD,
    ### Program Shortcuts
    Key([], "Print",
        lazy.spawn("flameshot gui"),
        desc="Take a screenshot"
        ),
    Key([mod], "a",
        lazy.spawn("/home/alex/.config/rofi/applets/bin/apps.sh"),
        desc="Apps Applet"
        ),
    Key([mod], "b",
        lazy.spawn("firefox"),
        desc='Spawn Firefox'
        ),
    Key([mod], "g",
        lazy.spawn("/home/alex/.config/rofi/launchers/type-3/launcher-games.sh"),
        desc="Games Applet"
        ),
    Key(["mod1"], "Tab",
        lazy.spawn(ROFI_WINDOW_SWITCHER_CMD),
        desc="Switch Between Windows"
        ),
    Key([mod], "slash",
        lazy.spawn("/home/alex/Scripts/rofi-search-script"),
        desc="Search the web with Rofi"
        ),
    ### Core Qtile Functions
    Key([mod], "Tab",
        lazy.next_layout(),
        desc='Toggle between layouts'
        ),
    Key([mod], "q",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.restart(), lazy.spawn("notify-send 'Qtile' 'Restarted Qtile'"),
        desc='Restart Qtile'
        ),
    Key([mod, "control"], "r",
        lazy.reload_config(), lazy.spawn("notify-send 'Qtile' 'Reloaded config'"),
        desc="Reload the config"
        ),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'
        ),
    ### Switch focus of monitors
    Key([mod, "shift"], "right",
        lazy.next_screen(),
        desc='Move focus to next monitor'
        ),
    Key([mod, "shift"], "left",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
        ),
    ### Seitch focus of groups
    Key([mod], "right",
        lazy.screen.next_group(),
        desc='Move focus to next group'
        ),
    Key([mod], "left",
        lazy.screen.prev_group(),
        desc='Move focus to prev group'
        ),
    ### Tretab controls
    Key([mod, "shift"], "h",
        lazy.layout.move_left(),
        desc='Move up a section in treetab'
        ),
    Key([mod, "shift"], "l",
         lazy.layout.move_right(),
         desc='Move down a section in treetab'
         ),
    ### Window controls
    Key([mod], "down",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "up",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "down", 
        lazy.layout.shuffle_down(), lazy.layout.section_down(),
        desc="Move window down in current stack"
        ),
    Key([mod, "shift"], "up", 
        lazy.layout.shuffle_up(), lazy.layout.section_up(),
        desc="Move window up in current stack"
        ),
    Key([mod], "h",
        lazy.layout.shrink(),lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.grow(),lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='Reset all window sizes'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='Toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='Toggle floating'
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='Toggle fullscreen'
        ),
    ### Stack controls
    Key([mod, "shift"], "Tab",
        lazy.layout.rotate(), lazy.layout.flip(),
        desc='Switch which side main pane occupies (MonadTall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    Key([mod, "shift"], "space",
        lazy.layout.toggle_split(),
        desc='toggle between split and unsplit sides of stack'
        ),
    ### Keyboard buttons
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pulseaudio-ctl up 1"), desc="Raise Volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pulseaudio-ctl down 1"), desc="Lower Volume"),
    Key([], "XF86AudioMute", lazy.spawn("pulseaudio-ctl mute"), desc="Mute Volume"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Play/Pause"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Stop"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Prev"),
]
# END_KEYS
