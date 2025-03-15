#!/bin/bash
set -e
echo "[Syncing started]"

# 単体ファイルをコピー
cp -f ~/.bashrc ~/settings/.bashrc
cp -f ~/.bash_profile ~/settings/.bash_profile
cp -f ~/.profile ~/settings/.profile
cp -f ~/.xinitrc ~/settings/.xinitrc
cp -f ~/.vimrc ~/settings/.vimrc

# ディレクトリをrsyncで同期
rsync -a --delete ~/.config/hypr/ ~/settings/hypr/
rsync -a --delete ~/.config/waybar/ ~/settings/waybar/
rsync -a --delete ~/.config/dunst/ ~/settings/dunst/
rsync -a --delete ~/.config/fcitx5/ ~/settings/fcitx5/

echo "[Syncing complete]"
