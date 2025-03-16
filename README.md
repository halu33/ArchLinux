# ArchLinux Settings Backup

このリポジトリは、**Arch Linux 環境の設定ファイルをバックアップ・管理するためのリポジトリ**
Hyprland + Wayland 環境を中心とした個人のセットアップを保存

---

## 目的

- Arch Linux の再インストールや他マシンへの移行時に、設定を簡単に復元できるようにする
- `.bashrc` などのシェル設定や、Hyprland、Waybar、dunstなどの設定を一括管理
- 実体ファイルと編集用シンボリックリンクを分けて運用（Git には実体のみを管理）

---

## 運用方法

### 1. 設定ファイルを編集したいとき

`~/settings/links/` にあるシンボリックリンクを編集する（実体に反映される）。

### 2. Git にプッシュする前に実体を同期

`~/settings/sync.sh` を実行して実体ファイルを更新し、その後 Git にプッシュする。

```bash
cd ~/settings
./sync.sh
git add .
git commit -m "update message"
git push origin main
```

---

## `.gitignore` の設計

- `links/` ディレクトリを除外（シンボリックリンクはGit管理対象外）
- `.cache/`, `*.log`, `*.tmp` などの一時ファイル・ログも除外
- `*.key`, `.ssh/` などの機密情報はGitに含めないように除外

---

## セキュリティ上の注意

- このリポジトリを **公開にする場合は** `.gitignore` により機密ファイルが除外されていることを確認すること
- SSHキー・GPGキー・パスワード・トークン類が含まれていないか最終チェックすること

---

## 環境情報

- OS: Arch Linux (Surface Pro 7)
- DE: Hyprland (Wayland)
- IME: fcitx5 + mozc
- ターミナル: alacritty
- エディタ: VSCode (visual-studio-code-bin)

---

## スクリプト一覧

| ファイル名        | 説明 |
|------------------|------|
| `sync.sh`        | シンボリックリンクから設定ファイルを同期（実体コピー） |
| `ssd_backup.sh`  | SSD 接続時にバックアップを自動で実行 |
| `ssd_removed.sh` | SSD 取り外し時の処理を自動で実行 |

---

## ファイル構造

```
settings/
├── .bashrc
├── .bash_profile
├── .profile
├── .xinitrc
├── .vimrc
├── hypr/
│   └── hyprland.conf
├── waybar/
│   ├── config
│   └── style.css
├── dunst/
│   └── dunstrc
├── sync.sh
├── ssd_backup.sh
├── ssd_removed.sh
├── .gitignore
├── README.md
└── links/
    ├── bashrc_link -> ~/.bashrc
    ├── bash_profile_link -> ~/.bash_profile
    ├── profile_link -> ~/.profile
    ├── xinitrc_link -> ~/.xinitrc
    ├── vimrc_link -> ~/.vimrc
    ├── hyprland.conf_link -> ~/.config/hypr/hyprland.conf
    ├── waybar_config_link -> ~/.config/waybar/config
    ├── waybar_style.css_link -> ~/.config/waybar/style.css
    └── dunstrc_link -> ~/.config/dunst/dunstrc
```