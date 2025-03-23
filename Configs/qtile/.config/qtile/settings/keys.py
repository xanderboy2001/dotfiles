from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from settings.path import *
from settings.functions import *
from os import path

# Rofi Commands
ROFI_WINDOW_SWITCHER_CMD="rofi -show window -modi window -window-matching-fields desktop -filter -ScratchPad -show-icons -window-prefer-icon-theme true -theme-str 'inputbar { enabled: false; } listview { fixed-height: false; }'"
ROFI_CALC_CMD="rofi -show calc -modi calc -no-show-match -no-sort -theme-str 'inputbar { enabled: false; } listview { fixed-height: false; }'"
ROFI_POWER_MENU_CMD=f'{rofi_path}/powermenu/type-1/powermenu.sh'
ROFI_GREENCLIP_CMD="rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"
ROFI_GAMES_CMD="rofi -modi games -show games -theme games"
ROFI_LAUNCHER_CMD=f'{rofi_path}/launchers/type-2/launcher.sh'
ROFI_SYMBOL_CMD="rofi -modi 'emoji:rofimoji',nerdy -show emoji"

mod="mod4"

# KEY_CHORDS
SCRATCHPAD_CHORD=KeyChord(
        [mod], "s", [
            Key([], "t",
                lazy.group['scratchpad'].dropdown_toggle('term'),
                desc='Toggle terminal ScratchPad'
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

# START_KEYS
keys = [
    ### The essentials
    Key(["control", "mod1"], "Delete",
        lazy.spawn(ROFI_POWER_MENU_CMD),
        desc="Run Rofi power menu."
        ),
    Key([mod], "Return",
        lazy.spawn('alacritty'),
        desc='Launch terminal'
        ),
    Key([mod, "shift"], "Return",
        lazy.spawn(ROFI_LAUNCHER_CMD),
        desc='Run Rofi Launcher'
        ),
    ### ScratchPads
    SCRATCHPAD_CHORD,
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
        lazy.spawn("zen-browser"),
        desc='Spawn Zen Browser'
        ),
    Key([mod], "e",
        lazy.spawn(ROFI_SYMBOL_CMD),
        desc='Spawn Symbol Picker (rofi)'
        ),
    Key([mod], "g",
        lazy.spawn(ROFI_GAMES_CMD),
        desc="Games Applet"
        ),
    Key([mod], "v",
        lazy.spawn(ROFI_GREENCLIP_CMD),
        desc="Spawn rofi-greenclip"
        ),
    Key(["mod1"], "Tab",
        lazy.spawn(ROFI_WINDOW_SWITCHER_CMD),
        desc="Switch Between Windows"
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
    Key([], "XF86AudioRaiseVolume", lazy.spawn(f'{qtile_path}/scripts/change-volume.sh up'), desc="Raise Volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(f'{qtile_path}/scripts/change-volume.sh down'), desc="Lower Volume"),
    Key([], "XF86AudioMute", lazy.spawn(f'{qtile_path}/scripts/mute-volume.sh'), desc="Mute Volume")
]
# END_KEYS
