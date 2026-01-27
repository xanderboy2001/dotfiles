function cfg-pull --wraps='pushd && /home/alex/.dotfiles git pull; popd' --description 'alias cfg-pull=pushd && /home/alex/.dotfiles git pull; popd'
    pushd && /home/alex/.dotfiles git pull; popd $argv
end
