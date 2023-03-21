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
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "[ ${green}INFO${NC} ] Start " 
sleep 0.5
systemctl stop nginx
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
systemctl enable xray.service
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl restart xray.service
echo $domain > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
