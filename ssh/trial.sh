#!/bin/bash
# SL
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "$ Permission Accepted..."
else
echo -e "$ Permission Denied!";
echo -e "$ Fuck You!!"
exit 0
fi
source /var/crot/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
nsdomain=$(cat /etc/xray/dns)
key=$(cat /etc/slowdns/server.pub)
else
domain=$IP2
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "===============================" | lolcat
echo -e "   Informasi SSH & OpenVPN       "
echo -e "===============================" | lolcat
echo -e "  Domain          : $domain"
echo -e "  Username        : $Login"
echo -e "  Password        : $Pass"
echo -e "  Nameserver      : $nsdomain"
echo -e "  Public Key       : $key"
echo -e "===============================" | lolcat
echo -e "       Port Information            "
echo -e "===============================" | lolcat
echo -e "OpenSSH            : 443, 22"
echo -e "Dropbear           : 443, 109, 143"
echo -e "SSL/TLS            :$ssl"
echo -e "OHP SSH            : 8181"
echo -e "OHP Dropbear       : 8282"
echo -e "OHP OpenVPN        : 8383"
echo -e "SSH Websocket SSL  : 443"
echo -e "SSH Websocket HTTP : 80, 8880"
echo -e "OVPN Websocket     : 2086"
echo -e "OVPN Port SSL      : 990"
echo -e "OVPN TCP           : http://$domain:89/tcp.ovpn"
echo -e "OVPN UDP           : http://$domain:89/udp.ovpn"
echo -e "OVPN SSL           : http://$domain:89/ssl.ovpn"
echo -e "BadVpn             : 7100-7200-7300"
echo -e "Created            : $hariini"
echo -e "Expired            : $expi"
echo -e "==============================" | lolcat
echo -e "   Payload Websocket SSL/TLS "
echo -e "==============================" | lolcat
echo -e "GET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================" | lolcat
echo -e "   Payload Websocket HTTP "
echo -e "==============================" | lolcat
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "===============================" | lolcat
echo -e "   Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e "    Terimakasih Telah "
echo -e "  Menggunakan Layanan Kami "
echo -e ""
echo -e "===============================" | lolcat
echo -e "