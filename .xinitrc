#!/bin/bash

# ----------------------------------------
# XDG 環境変数の設定 (X11 用)
# ----------------------------------------
[ -f ~/.xprofile ] && source ~/.xprofile

# ----------------------------------------
# XDG 環境変数の設定 (Wayland 用)
# ----------------------------------------
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland

# `XDG_RUNTIME_DIR` が存在しない場合に作成
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

# ----------------------------------------
# IME (日本語入力) の設定 (fcitx5)
# ----------------------------------------
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=fcitx5

# `fcitx5` をバックグラウンドで起動
if command -v fcitx5 &> /dev/null; then
    fcitx5 -d
fi

# ----------------------------------------
# キーボードレイアウトの設定
# ----------------------------------------
if command -v setxkbmap &> /dev/null; then
    setxkbmap -layout jp
fi

# ----------------------------------------
# 画面のティアリング防止 (NVIDIA)
# ----------------------------------------
if command -v nvidia-smi &> /dev/null; then
    export __GL_VRR_ALLOWED=0
    export WLR_NO_HARDWARE_CURSORS=1
    export LIBVA_DRIVER_NAME=nvidia
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
fi

# ----------------------------------------
# Wayland 用の変数 (アプリ互換性向上)
# ----------------------------------------
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland,x11
export CLUTTER_BACKEND=wayland
