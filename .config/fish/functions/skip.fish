function skip --wraps='tail' --description "Function for ignoring the first 'n' lines"
    tail +(math 1 + $argv)
end
