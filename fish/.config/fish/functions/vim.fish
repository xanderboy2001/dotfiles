function vim --wraps=nvim --description 'alias vim=nvim'
  if type -q nvim
    nvim $argv
  end
end
