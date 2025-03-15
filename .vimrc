" ----------------------------------------
" 基本設定
" ----------------------------------------

" UTF-8 をデフォルトエンコーディング
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp

" 日本語の表示
set fileformats=unix,dos,mac
set termencoding=utf-8

" バックスペースで削除
set backspace=indent,eol,start

" 行番号を表示
set number

" ステータスラインを常に表示
set laststatus=2

" カーソル行をハイライト
set cursorline

" 自動インデントを有効化
set autoindent
set smartindent

" スペース、タブ、改行を可視化
set list
set listchars=tab:▸\ ,trail:･

" 256色対応ターミナル用のカラースキーム
set t_Co=256
colorscheme desert

" ----------------------------------------
" タブ・インデント設定
" ----------------------------------------

" タブをスペースに変換
set expandtab
" タブ幅を4スペースに設定
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ----------------------------------------
" カーソル移動の強化
" ----------------------------------------

" 行が折り返されたときに矢印キーで移動しやすくする
nnoremap j gj
nnoremap k gk

" ----------------------------------------
" 最後の編集位置に復帰
" ----------------------------------------

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ----------------------------------------
" 自動保存（10秒）
" ----------------------------------------

set updatetime=10000
autocmd CursorHold * silent! w

" ----------------------------------------
" fcitx5 (日本語入力) の対応
" ----------------------------------------

if executable('fcitx5-remote')
    let fcitx5state = system('fcitx5-remote')
    autocmd InsertLeave * let fcitx5state = system('fcitx5-remote -c')
    autocmd InsertEnter * if fcitx5state == 2 | call system('fcitx5-remote -o') | endif
endif

" ----------------------------------------
" 日本語フォントの対応
" ----------------------------------------

" 日本語の表示がずれるのを防ぐ
set ambiwidth=double

" ----------------------------------------
" 検索設定
" ----------------------------------------

" 検索時に大文字・小文字を区別しない
set ignorecase

" 大文字を含む検索は区別
set smartcase

" インクリメンタルサーチ（リアルタイム検索）
set incsearch

" 検索結果をハイライト
set hlsearch
