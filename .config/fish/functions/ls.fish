function ls --wraps='exa -al --color=always --group-directories-first' --description 'alias ls=exa -al --color=always --group-directories-first'
  exa -al --icons --color=always -g --group-directories-first $argv
        
end
