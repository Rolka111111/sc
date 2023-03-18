#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
echo -e "==============================="
echo -e ".               Running... "
echo -e "==============================="
echo -e "       Port 80 Akan di Hentikan"
echo -e "        Saat Proses install Cert"
echo -e "==============================="
echo -e "        Script By MakhlukVpn          "
echo -e "==============================="
sleep 1
source /var/lib/crot/ipvps.conf
domain=$(cat /etc/xray/domain)
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m makhlukvpn@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
