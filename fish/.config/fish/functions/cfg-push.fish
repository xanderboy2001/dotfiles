function cfg-push --wraps='pushd /home/alex/.dotfiles && git push; popd' --description 'alias cfg-push=pushd /home/alex/.dotfiles && git push; popd'
  pushd /home/alex/.dotfiles && git push; popd $argv
end
