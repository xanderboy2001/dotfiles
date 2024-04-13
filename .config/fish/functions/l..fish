function l. --wraps=exa\ -a\ \|\ egrep\ \"^\\.\" --wraps=exa\ -a\ \$argv\ \|\ egrep\ \"^\\.\" --description alias\ l.=exa\ -a\ \$argv\ \|\ egrep\ \"^\\.\"
  exa -a $argv | grep -E "^\." $argv
        
end
