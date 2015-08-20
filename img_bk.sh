#!/usr/bin/env bash
yestoday=$(date -d "-1 day" "+%Y%m%d")
echo $yestoday

#备份数据库
mkdir -p /home/backup/sql/$yestoday
mysqldump -h 10.18.20.3 -ufourbbkp -pfbbackup --databases sms > /home/backup/sql/$yestoday/sms.sql
tar -cf /home/backup/sql/${yestoday}.tar /home/backup/sql/$yestoday

#备份图片
tar -cf /home/backup/img/${yestoday}.tar /upload/sms.4b/pic/$yestoday
