function ll --wraps='exa -l --color=always --group-directories-first' --wraps='exa -l -g --icons --color=always --group-directories-first' --description 'alias ll=exa -l -g --icons --color=always --group-directories-first'
  exa -l -g --icons --color=always --group-directories-first $argv
        
end
