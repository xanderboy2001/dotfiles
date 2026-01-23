function sysupdate --description 'Runs full upgrade of system'
		# Detect distro by checking /etc/os-release
		if not test -f /etc/os-release
				echo "Cannot detect OS."
				return 1
		end

		set os_id (grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')
		set os_like (grep '^ID_LIKE=' /etc/os-release | cut -d '=' -f2 | tr -d '"')

		# Debian-based
		if string match -q debian $os_id; or string match -q '*debian*' $os_like
				echo "Debian-based system detected. Running apt..."
				sudo apt update && sudo apt upgrade -y
				return
		end

		# Arch-based
		if string match -q arch $os_id; or string match -q '*arch*' $os_like
				echo "Arch-based system detected."
				if type -q arch-update
						arch-update
						return
				end

				for helper in paru yay trizen pikaura
						if type -q $helper
								$helper -Syyu
								return
						end
				end

				sudo pacman -Syyu --noconfirm
				return
		end

		echo "Unsupported OS: $os_id"
		return 1
end
