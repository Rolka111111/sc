#!/bin/bash
# SL
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
domain=$(cat /etc/xray/domain)
nsdomain=$(cat /etc/xray/dns)
key=$(cat /etc/slowdns/server.pub)
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "===============================" | lolcat
read -rp "Username : " -e user
CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo -e "===============================" | lolcat
echo -e "  Username ${user} Already On "
echo -e "    VPS Please Choose Another"
echo -e "===============================" | lolcat
exit 1
fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
echo -e "===============================" | lolcat
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
clear
echo -e ""
echo -e "========={XRAYS/VLESS}==========" | lolcat
echo -e "Remarks     : ${user}"
echo -e "Address     : ${domain}"
echo -e "Nameserver  : $nsdomain"
echo -e "Pub Key     : $key"
echo -e "Port TLS    : $tls"
echo -e "Port No TLS : $nontls"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Network     : ws"
echo -e "Path        : /vless"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "===============================" | lolcat
echo -e "Link TLS    : ${xrayvless1}"
echo -e "===============================" | lolcat
echo -e "Link No TLS : ${xrayvless2}"
echo -e "===============================" | lolcat
echo -e "   Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e "     Terimakasih Telah "
echo -e "  Menggunakan Layanan Kami "
echo -e ""
echo -e "===============================" | lolcat
echo -e ""
