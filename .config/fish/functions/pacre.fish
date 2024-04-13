function pacre --wraps='sudo pacman -R' --description 'alias pacre=sudo pacman -R'
  sudo pacman -R $argv
        
end
