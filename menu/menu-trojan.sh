#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e "===============================" | lolcat
echo -e "        Menu Xray | Trojan "
echo -e "===============================" | lolcat
echo -e " 1}.$green Create Account Trojan Go"
echo -e " 2}.$green Delete Account Trojan Go"
echo -e " 3}.$green Extending Account Trojan Go Active Life"
echo -e " 4}.$green Check User Login Trojan Go"
echo -e " 5}.$green Menu"
echo -e " x}.$red Exit"
echo -e "===============================" | lolcat
echo -e "        Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e ""
echo -e "===============================" | lolcat
read -p "Select From Options [ 1 - 5 or [x]  ] : " menu-trojan
echo -e "===============================" | lolcat
echo -e ""
case $menu-trojan in
1)
addtrgo
;;
2)
deltrgo
;;
3)
renewtrgo
;;
4)
cektrgo
;;
5)
menu
;;
x)
exit
;;
esac
