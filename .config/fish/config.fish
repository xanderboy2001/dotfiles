### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin  $HOME/.local/bin $HOME/Scripts /var/lib/flatpak/exports/bin $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"       		                  		# $EDITOR use vi in terminal
set VISUAL "nvim"		                          		# $VISUAL use nvim
set QT_QPA_PLATFORMTHEME 'qt5ct'
set VIRTUAL_ENV_DISABLE_PROMPT "1"								# Disable venv text from prepending shell prompt
set -x MANROFFOPT "-c"														# Disable color output in man pages as bat already does it
set -x SHELL /bin/fish														# Make default shell fish

### SET MANPAGER
### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"			# Set bat as the manpager

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
   fish_vi_key_bindings
  end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SSH-AGENT ###
fish_ssh_agent

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

### Initializing zoxide ###
zoxide init fish | source
