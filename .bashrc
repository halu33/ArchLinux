#
# ~/.bashrc
#

# ----------------------------------------
# シェルの種類を判定、対話シェルでない場合は終了
# ----------------------------------------
[[ $- != *i* ]] && return

# ----------------------------------------
# エイリアスの設定
# ----------------------------------------

# ls
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'

# cdの後にlsを自動実行
cd() { builtin cd "$@" && ls --color=auto; }

# grep
alias grep='grep --color=auto'

# ファイル操作時に確認を求めるオプション
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# システム情報コマンド
alias df='df -h'
alias free='free -h'

# ディレクトリ移動のショートカット
alias ..='cd ..'
alias ...='cd ../..'

# `mkdir` で親ディレクトリも作成
alias mkdir='mkdir -p'

# sudo でもエイリアスを有効にする
alias sudo='sudo '

# ----------------------------------------
# プロンプトのカスタマイズ
# ----------------------------------------

# `PS1` の設定: ユーザー名@ホスト名 + カレントディレクトリを表示
export PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] \$ "

# ----------------------------------------
# fcitx5の環境変数設定
# ----------------------------------------

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus

# ----------------------------------------
# シェルの履歴設定
# ----------------------------------------

# 同じコマンドの重複を記録しない & スペースで開始したコマンドを記録しない
export HISTCONTROL=ignoreboth

# 保存する履歴の最大数
export HISTSIZE=100000

# 履歴ファイルの最大サイズ
export HISTFILESIZE=200000

# ----------------------------------------
# システム情報の自動表示
# ----------------------------------------

command -v neofetch >/dev/null 2>&1 && neofetch

# ----------------------------------------
# 研修課題用
# ----------------------------------------

alias kensyu="~/kensyu/kensyu.sh"
