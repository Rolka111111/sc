#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e "===============================" | lolcat
echo -e ".       XRAY | VMESS / VLESS "
echo -e "===============================" | lolcat
echo -e " 1}.$green Create Account Vmess Websocket"
echo -e " 2}.$green Delete Account Vmess Websocket"
echo -e " 3}.$green Extending Account Vmess Active Life"
echo -e " 4}.$green Check User Login Vmess"
echo -e "===============================" | lolcat
echo -e " 5}.$green Create Account Vless Websocket"
echo -e " 6}.$green Delete Account Vless Websocket"
echo -e " 7}.$green Extending Account Vless Active Life"
echo -e " 8}.$green Check User Login Vless"
echo -e " 9}.$green Menu"
echo -e " x}.$red Exit"
echo -e ""
echo -e "===============================" | lolcat
echo -e "        Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e ""
echo -e "===============================" | lolcat
read -p "  Select From Options [ 1 - 9 or [x] ] : " menu-xray
echo -e "===============================" | lolcat
echo -e ""
case $menu-xray in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
addvless
;;
6)
delvless
;;
7)
renewvless
;;
8)
cekvless
;;
9)
clear
menu
;;
x)
clear
exit
;;
esac
