#!/bin/bash

# 環境変数を設定
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# ログファイル
logfile="/home/haru/log/backup.log"
echo "[`date`] SSD backup started" >> "$logfile"

# systemd-automount をトリガーするためアクセス
ls /home/haru/ssd_ext > /dev/null 2>&1 || true

# SSDがマウントされるまで10秒待機
timeout=10
while ! mountpoint -q /home/haru/ssd_ext; do
  sleep 1
  timeout=$((timeout - 1))
  if [ $timeout -le 0 ]; then
    echo "[`date`] SSD not mounted after waiting" >> "$logfile"
    notify-send "SSD Backup Failed" "SSDがマウントされていません" || true
    exit 1
  fi
done

mkdir -p /home/haru/ssd_ext/backup_home

# rsync 実行
cd /home/haru || exit 1
/usr/bin/rsync -aAXv --delete \
  --exclude="ssd_ext/" \
  --exclude=".cache/" \
  ./ /home/haru/ssd_ext/backup_home/ >> "$logfile" 2>&1

# 成功通知
notify-send "SSD Backup Complete" "バックアップが正常に完了しました！" || true

