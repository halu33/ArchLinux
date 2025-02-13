#
# ~/.bashrc
#

# インタラクティブシェルでない場合は処理を終了
[[ $- != *i* ]] && return

# コマンドのエイリアス設定、色付き表示を有効化
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# プロンプトのカスタマイズ
PS1='[\u@\h \W]\$ '

# 日本語入力fcitx5の環境変数設定
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# システム情報を表示
neofetch

# パッケージの設定
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# `kensyu` スクリプトのエイリアス（VagrantやVirtualBox環境構築用）
alias kensyu="~/kensyu/kensyu.sh"
