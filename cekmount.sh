#!/bin/bash
  TOKEN="fdgdgfdgfd"
  CHAT_ID=id
  host="$(hostname)"
  URL="https://api.telegram.org/bot$TOKEN/sendMessage"
 usage="$(df -h /home/ijak | tr -s ' ' $'\t' | grep sdb1 |  cut -f3)"
  date="$(date "+%d %b %Y %H:%M")"

FILE=/home/mountdisk/directory/cekdisk.txt
touch ${FILE}
if [ -f ${FILE} ];
then
   rm ${FILE}
   echo "ok"
else
  message="RO"
  TEXT=" $host | $date | $usage | readonly"
        curl -s -d "chat_id=${CHAT_ID}&text=${TEXT}&disable_web_page_preview=true&parse_mode=html" ${URL} > /dev/null
    kill $(ps aux | grep '/home/ijak' | awk '{print $2}')
   sleep 5s
   echo "wafaddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
   umount -l /home/mountdisk
   sleep 5s
   /usr/bin/mount /dev/sdb1 /home/mountdisk
fi
