#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e ""
echo -e "===============================" | lolcat
echo -e "             Menu Manager  "        
echo -e "===============================" | lolcat
echo -e ""
echo -e " 1}.$green  Manager SSH & OpenVPN"
echo -e " 2}.$green  Manager X-RAY Vmess & Vless"
echo -e " 3}.$green  Manager Xray Trojan Ws & Go"
echo -e " 4}.$green  Restart All Service"
echo -e " 5}.$green  Add Domain"
echo -e " 6}.$green  Renew Certificate Xray"
echo -e " 7}.$green  Info Service Running "
echo -e " 8}.$green  Info ScriptAutoInstaller "
echo -e " 9}.$green  Cloud Manager Drive "
echo -e " 10}.$green  Reboot Vps "
echo -e " x}.$red  Exit"
echo -e ""
echo -e "===============================" | lolcat
echo -e "        Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e ""
echo -e "==============================="
read -p "   Please Input Number  [1-10 or [x] ] :  "  menu
echo -e "==============================="
case $menu in
1)
menu-ssh
;;
2)
menu-xray
;;
3)
menu-trojan
;;
4)
restart
;;
5)
addhost
;;
6)
certv2ray
;;
7)
running
;;
8)
about
;;
9)
menu-cloud
;;
10)
reboot
;;
x)
exit
;;
esac
