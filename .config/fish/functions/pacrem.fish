function pacrem --wraps='sudo pacman -Rns' --description 'alias pacrem=sudo pacman -Rns'
  sudo pacman -Rns $argv
        
end
