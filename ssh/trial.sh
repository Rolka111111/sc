#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
nsdomain=$(cat /etc/xray/dns)
key=$(cat /etc/slowdns/server.pub)
IP=$(wget -qO- ipinfo.io/ip);
Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=18`</dev/urandom tr -dc X-Z0-9 | head -c4`
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
echo -e "  Public Key      : $key"
echo -e "  Created         : $hariini"
echo -e "  Expired         : $expi"
echo -e "===============================" | lolcat
echo -e "      Port Information            "
echo -e "===============================" | lolcat
echo -e " OpenSSH            : 22, 443"
echo -e " Dropbear           : 109, 143, 443 "
echo -e " SSL/TLS            : 443, 445"
echo -e " SSH Websocket SSL  : 443"
echo -e " SSH Websocket HTTP : 80 "
echo -e " OVPN Websocket     : 2086"
echo -e " OVPN SSL WS-SSL    : 443, 990"
echo -e " OVPN TCP UDP       : 1194, 2200"
echo -e " OHP SSH            : 8181"
echo -e " OHP Dropbear       : 8282"
echo -e " OHP OpenVPN        : 8383"
echo -e "==============================" | lolcat
echo -e " OVPN CONFIG        : http://$domain:89/OpenVPN.zip"
echo -e " BadVpn             : 7100-7200-7300"
echo -e "==============================" | lolcat
echo -e "   Payload Websocket SSL/TLS "
echo -e "==============================" | lolcat
echo -e " GET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================" | lolcat
echo -e "   Payload Websocket HTTP "
echo -e "==============================" | lolcat
echo -e " GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "===============================" | lolcat
echo -e "   Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e "    Terimakasih Telah "
echo -e "  Menggunakan Layanan Kami "
echo -e ""
echo -e "===============================" | lolcat
echo -e ""
