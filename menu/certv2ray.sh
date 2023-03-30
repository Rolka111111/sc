#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
domain=$(cat /etc/xray/domain)
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "[ ${green}INFO${NC} ] Starting Install Cert..... " 
sleep 0.5
systemctl enable xray@v2ray-tls
systemctl enable xray@v2ray-nontls
systemctl enable xray@vless-tls
systemctl enable xray@vless-nontls
systemctl enable xray@trojan
echo -e "[ ${green}INFO${NC} ] Processing 10 second to stop port 80 " 
sleep 2
echo -e "1"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "2"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "3"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "4"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "5"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "6"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "7"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "8"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "9"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "10"
sudo fuser -k 80/tcp
sleep 0.2
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl restart xray@v2ray-tls
systemctl restart xray@v2ray-nontls
systemctl restart xray@vless-tls
systemctl restart xray@vless-nontls
systemctl restart xray@trojan
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
