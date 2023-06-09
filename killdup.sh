#!/bin/sh

exec ps -ef | grep fcitx5 | grep -v grep | awk '{print $2}' | xargs kill & exec fcitx5 -d 
