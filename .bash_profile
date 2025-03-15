#
# ~/.bash_profile
#

# ----------------------------------------
# ログインメッセージ
# ----------------------------------------
echo "Welcome, $(whoami)! Logged in on $(date)."

# ----------------------------------------
# 環境変数
# ----------------------------------------
export PATH=$HOME/.local/bin:$PATH

# ----------------------------------------
# SSH接続時に tmux を自動起動
# ----------------------------------------
if [[ -n $SSH_CONNECTION ]] && ! pgrep -x tmux > /dev/null; then
    exec tmux new-session -A -s default
fi

# ----------------------------------------
# neofetch の自動実行 (hushlogin で無効化可能)
# ----------------------------------------
if [[ ! -f ~/.hushlogin ]]; then
    command -v neofetch >/dev/null 2>&1 && neofetch
fi
