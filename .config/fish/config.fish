### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin  $HOME/.local/bin $HOME/Scripts /var/lib/flatpak/exports/bin $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"       		                  # $EDITOR use vi in terminal
set VISUAL "nvim"		                          # $VISUAL use nvim
set QT_STYLE_OVERRIDE "kvantum"

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
#function fish_user_key_bindings
  # fish_default_key_bindings
  # fish_vi_key_bindings
  #end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SSH-AGENT ###
if not pgrep --full ssh-agent | string collect > /dev/null
	eval (ssh-agent -c)
	set -Ux SSH_AGENT_PID $SSH_AGENT_PID
	set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

### Initializing zoxide ###
zoxide init fish --cmd cd | source
