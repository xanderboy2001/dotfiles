function cfg-commit --wraps='pushd /home/alex/.dotfiles && git add . && git commit; popd' --description 'alias cfg-commit=pushd /home/alex/.dotfiles && git add . && git commit; popd'
  pushd /home/alex/.dotfiles && git add . && git commit; popd $argv
end
