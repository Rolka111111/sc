#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl ipinfo.io/ip | grep $MYIP )

clear
read -rp "Domain/Host : " -e domain
echo "IP=$domain" >>/var/lib/crot/ipvps.conf
rm -rf /etc/xray/domain
echo $domain > /etc/xray/domain
certv2ray
echo -e "===============================" | lolcat
echo -e "             Succesfully
echo -e "===============================" | lolcat
echo -e "        Script By MakhlukVpn          "
echo -e "===============================" | lolcat