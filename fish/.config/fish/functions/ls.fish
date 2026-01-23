function ls --wraps='exa -al --icons --color=always -g --group-directories-first' --description 'alias ls=exa -al --icons --color=always -g --group-directories-first'
  exa -al --icons --color=always -g --group-directories-first $argv
        
end
