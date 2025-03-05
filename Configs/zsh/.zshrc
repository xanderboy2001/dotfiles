# Lines configured by zsh-newuser-install
HISTFILE=/home/alex/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install

### Configure Completions ###
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall



### zplug ###
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-syntax-highlighting"
zplug "dracula/zsh", as:theme
zplug "agpenton/1password-zsh-plugin"
zplug "chrissicool/zsh-256color"
zplug "se-jaeger/zsh-activate-py-environment"
zplug "casonadams/alacritty-shell"
zplug "akash329d/zsh-alias-finder"
zplug "djui/alias-tips"
zplug "sparsick/ansible-zsh"
#zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-autosuggestions"
zplug "fdellwing/zsh-bat"
zplug "zpm-zsh/clipboard"
zplug "ael-code/zsh-colored-man-pages"
zplug "zpm-zsh/colorize"
zplug "aubreypwd/zsh-plugin-download"
zplug "DarrinTisdale/zsh-aliases-exa"
zplug "MohamedElashri/fd-zsh"
zplug "QuarticCat/zsh-smartcache"
zplug "marzocchi/zsh-notify"
zplug "wuotr/zsh-plugin-vscode"
zplug "sdiebolt/zsh-ssh-agent"
zplug "gko/ssh-connect"
zplug "unixorn/1password-op.plugin.zsh"
zplug "sfischer13/zsh-sensible"


# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

### Keybindings ###
# Fix HOME and END keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
# Move backward by one word with Ctrl+Left
bindkey "^[[1;5D" backward-word
# Move forward by one word with Ctrl+Right
bindkey "^[[1;5C" forward-word


### Aliases ###
alias yayin='yay -S'
alias yayrem='yay -Rns'
alias yaylocs='yay -Qs'
alias vim='nvim'
#alias rm="trash"
if bat_loc="$(type -p "bat")" || [[ -z $bat_loc ]]; then
		alias cat='bat'
elif batcat_loc="$(type -p "batcat")" || [[ -z $batcat_loc ]]; then
		alias cat='batcat'
fi
alias ls='exa -al --icons --color=always -g --group-directories-first'
alias mkdir='mkdir -p'
alias eos-update='eos-update --aur'

### PATH ###
# append
export PATH="$PATH:/home/alex/.local/bin"

### GEM ###
# set gem home to ~/.gem
export GEM_HOME=$HOME/.gem

### FZF ###
fzf_version="$(fzf --version | cut -d. -f2)"
if [ $fzf_version -lt 48 ]; then
		source /usr/share/doc/fzf/examples/*.zsh
else
		source <(fzf --zsh)
fi

### Starship ###
eval "$(starship init zsh)"

### Zoxide ###
eval "$(zoxide init zsh --cmd cd)"

### Node Version Manager ###
NVM_INIT_PATH=/usr/share/nvm/init-nvm.sh
if [ -f $NVM_INIT_PATH ]; then . $NVM_INIT_PATH; fi
