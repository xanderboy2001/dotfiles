#!/usr/bin/env bash

pw-volume mute toggle > /dev/null

muted=$(pw-volume status | jq .alt)

if [[ "$muted" == '"mute"' ]]; then
		volnoti-show -m
else
		volume=$(pw-volume status | jq .percentage)
		volnoti-show $volume
fi
