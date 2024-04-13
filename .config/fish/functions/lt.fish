function lt --wraps='exa -aT --color=always --group-directories-first' --wraps='exa -aT -g --icons --color=always --group-directories-first' --description 'alias lt=exa -aT -g --icons --color=always --group-directories-first'
  exa -aT -g --icons --color=always --group-directories-first $argv
        
end
