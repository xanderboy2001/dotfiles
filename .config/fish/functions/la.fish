function la --wraps='exa -a --color=always --group-directories-first' --wraps='exa -a --icons --color=always -g --group-directories-first' --description 'alias la=exa -a --color=always --group-directories-first'
  exa -a --icons --color=always -g --group-directories-first $argv
        
end
