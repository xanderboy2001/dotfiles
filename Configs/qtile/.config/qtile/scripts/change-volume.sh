#!/usr/bin/env bash
set -euo pipefail

STEP=5

if [ $# -ne 1 ]; then exit 1; fi

if [[ $1 == 'up' ]]; then
		pw-volume change +$STEP%
elif [[ $1 == 'down' ]]; then
		pw-volume change -$STEP%
else
		exit 1
fi

volume=$(pw-volume status | jq .percentage)
volnoti-show $volume
