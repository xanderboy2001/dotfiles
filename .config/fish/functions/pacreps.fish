function pacreps --wraps='pacman -Ss' --description 'alias pacreps=pacman -Ss'
  pacman -Ss $argv
        
end
