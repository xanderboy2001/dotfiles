#!/usr/bin/env bash
set -euo pipefail

function confirm_yn {
	case $1 in
	"" | [yY]*) return 0 ;;
	[nN]*) return 1 ;;
	esac
}
read -rp "confirm (Y/n): " CONFIRM
if (confirm_yn "$CONFIRM"); then
	echo "You chose yes"
else
	echo "you chose no"
fi
