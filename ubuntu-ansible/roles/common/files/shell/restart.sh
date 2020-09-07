#!/bin/sh
set -e

now=`date +%Y%m%d-%H%M%S`
mv /var/log/nginx/access.log /var/log/nginx/access.log.$now # nginxのログをローテート
systemctl reload nginx

mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now # mysqlのslowlogをローテート
mysqladmin -uisucon -pisucon flush-logs

# エラーが出てないかログを見る
journalctl -f