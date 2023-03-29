#!/bin/bash
clear
#color
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Loading..."
IZIN=$( curl https://raw.githubusercontent.com/Annnjayy/sc/main/name | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "[ ${green}INFO${NC} ] Permission Accepted..."
else
echo -e "[ ${green}INFO${red} ] Permission Denied!${NC}";
echo -e "[ ${green}INFO${NC} ] Please Contact Admin!!"
echo -e "[ ${green}INFO${NC} ] WhatsApp : 087844547312"
echo -e "[ ${green}INFO${NC} ] Telegram : https://t.me/MakhlukVpn"
exit 0
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)
clear
echo "Starting Backup"
sleep 1
echo "Membuat Directory"
mkdir /root/backup
sleep 1
echo "Start Backup"
sleep 2
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp -r /etc/xray backup/xray
cp -r /etc/trojan-go backup/trojan-go
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r backup-$date.zip backup > /dev/null 2>&1
mv backup-$date.zip /home/vps/public_html
link="https://$domain:89/backup-$date.zip"
echo -e "The following is a link to your vps data backup file."
echo -e "===============================" | lolcat
echo -e "       Detail Backup   "
echo -e "===============================" | lolcat
echo -e " Ip VPS        : $IP"
echo -e " Domain VPS   : $IP"
echo -e " Link Backup   : $link"
echo -e "===============================" | lolcat
echo -e "      Script By MakhlukVpn"
echo -e "===============================" | lolcat
echo ""
echo -e "If you want to restore data, please copy the link above"
echo ""
rm -rf /root/backup
rm -r /root/backup-$date.zip
echo "Done"