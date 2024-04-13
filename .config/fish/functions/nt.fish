function nt --wraps='alacritty & ; disown %1' --description 'alias nt=alacritty & ; disown %1'
  alacritty & ; disown %1 $argv
        
end
