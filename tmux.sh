#!/bin/sh

sudo pacman -Sy --noconfirm tmux

curl -fsSL "https://github.com/gpakosz/.tmux/raw/refs/heads/master/install.sh#$(date +%s)" | bash
