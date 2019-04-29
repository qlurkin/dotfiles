#!/bin/bash
/usr/bin/gnome-keyring-daemon --start --components=secrets
nitrogen --restore &
udiskie &

