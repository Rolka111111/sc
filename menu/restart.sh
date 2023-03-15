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
clear
echo -e ""
echo -e "==============================="
echo -e "            Tunggu Sebentar"
echo -e "==============================="
echo -e "        Starting Restart All Service"
echo -e "==============================="
sleep 1
systemctl stop ws-tls 
pkill python
systemctl stop sslh
systemctl daemon-reload
systemctl disable ws-tls
systemctl disable sslh
systemctl daemon-reload
systemctl enable sslh
systemctl enable ws-tls
systemctl stop ws-tls
systemctl start sslh
systemctl restart sslh
/etc/init.d/sslh start
/etc/init.d/sslh restart
#systemctl restart ssrmu
systemctl start ws-tls
systemctl start ws-nontls
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray.service
systemctl restart sl-vless-grpc
systemctl restart sl-vmess-grpc
systemctl restart shadowsocks-libev
#systemctl restart xl2tpd
#systemctl restart pptpd
systemctl restart ipsec
systemctl restart accel-ppp
systemctl restart ws-ovpn
#systemctl restart wg-quick@wg0
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart trojan-go
#/etc/init.d/ssrmu restart
/etc/init.d/ssh restart
echo -e "        Starting Restart Ssh Service"
sleep 0.5
/etc/init.d/dropbear restart
echo -e "        Starting Restart Dropbear Service"
sleep 0.5
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel4 restart
echo -e "        Starting Restart Stunnel Service"
sleep 0.5
/etc/init.d/openvpn restart
echo -e "        Starting Restart openvpn Service"
sleep 0.5
/etc/init.d/fail2ban restart
echo -e "        Starting Restart Fail2ban Service"
sleep 0.5
/etc/init.d/cron restart
echo -e "        Starting Restart Cron Service"
sleep 0.5
/etc/init.d/nginx restart
echo -e "        Starting Restart Nginx Service"
sleep 0.5
/etc/init.d/squid restart
echo -e "        Starting Restart Squid Service"
sleep 0.5
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "==============================="
echo -e "        Restart All Service Berhasil"
echo -e "==============================="
echo -e "         Script By MakhlukVpn          "
echo -e "==============================="
echo -e ""