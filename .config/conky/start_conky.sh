#!/bin/bash
DIR=$HOME/.config/conky
killall conky
sleep $(echo 'scale=10; 10/60' | bc)
monitorCount=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
monitorCount=$((monitorCount-1))
for m in $(seq 0 1 $monitorCount); do
    conky -m $m -d -c $DIR/sysInfo.conf
    #conky -m $m -d -c $DIR/netInfo.conf
    #conky -m $m -d -c $DIR/rings.conf
done
#conky -m1 -d
#conky -c $HOME/.conky/updates.conkyrc
