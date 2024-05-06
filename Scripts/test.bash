declare -a arr
mapfile -t arr < <(grep -A1 "\[multilib\]" pacman.conf)
if [[ ${#arr[@]} -ne 2 ]]; then
		echo "ERROR. The string '[multilib]' was not found in /etc/pacman.conf (it should be!)
This could mean that pacman was not installed correctly.
You can suppress this message by manually enabling the multilib repository."
		exit
fi

if [[ ${arr[0]} == \#* && ${arr[1]} == \#* ]]; then
		echo "Multilib is not enabled"
		sed -i "/\[multilib\]/,/Include/"'s/^#//' pacman.conf
else
		echo "Multilib is already enabled"
fi

if grep -xq "^#Color" pacman.conf; then
		echo "Enabling color output in pacman..."
		sed -i 's/^#Color/Color/' pacman.conf
fi
