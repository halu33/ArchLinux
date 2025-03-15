#!/bin/bash
set -e
echo "[Syncing started]"

# 単体ファイル
cp -f ~/.bashrc ~/.bash_profile ~/.profile ~/.xinitrc ~/.vimrc ~/settings/

# Hyprland ディレクトリ同期
rsync -a --delete ~/.config/hypr/ ~/settings/hypr/

# Waybar ディレクトリ同期
rsync -a --delete ~/.config/waybar/ ~/settings/waybar/

# Dunst ディレクトリ同期
rsync -a --delete ~/.config/dunst/ ~/settings/dunst/

echo "[Syncing complete]"
