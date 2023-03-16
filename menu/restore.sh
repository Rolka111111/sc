#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e "===============================" | lolcat
echo -e "  Mohon Masukan Link Backup  "        
echo -e "===============================" | lolcat
read -rp "Link File: " -e url
echo -e "===============================" | lolcat
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r wireguard /etc/
cp -r crot /var/lib/
cp -r xray /etc/
cp -r trojan-go /etc/
cp -r public_html /home/vps/
cp crontab /etc/
strt
rm -rf /root/backup
rm -f backup.zip
echo -e "===============================" | lolcat
echo -e "      Restore Succesfully "
echo -e "===============================" | lolcat
echo -e "    Script By MakhlukVpn          "
echo -e "===============================" | lolcat
sleep 0.5
echo Done
