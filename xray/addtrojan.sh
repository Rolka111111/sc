#!/bin/bash
# My Telegram : https://t.me/colongvpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		echo -e "===============================" | lolcat
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/trojan.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo -e "===============================" | lolcat
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			echo -e "===============================" | lolcat
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
echo -e "===============================" | lolcat
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\### '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojan.json
systemctl restart xray@trojan
trojanlink="trojan://${user}@${domain}:2087"
service cron restart
clear
echo -e ""
echo -e "========={XRAYS/TROJAN}=========" | lolcat
echo -e "Remarks  : ${user}"
echo -e "Address  : ${domain}"
echo -e "Port     : 2087"
echo -e "Key      : ${user}"
echo -e "Created  : $hariini"
echo -e "Expired  : $exp"
echo -e "===============================" | lolcat
echo -e " Link TR WS  : ${link}"
echo -e "===============================" | lolcat
echo -e "   Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e "       Terimakasih Telah "
echo -e "   Menggunakan Layanan Kami "
echo -e ""
echo -e "===============================" | lolcat
echo -e ""