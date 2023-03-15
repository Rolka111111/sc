#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e ""
echo -e "===============================" | lolcat
echo -e "          SSH & OpenVPN Menu.           
echo -e "===============================" | lolcat
echo -e ""
echo -e " 1}.$green  Create SSH & OpenVPN Account"
echo -e " 2}.$green  Trial Account SSH & OpenVPN"
echo -e " 3}.$green  Renew SSH & OpenVPN Account"
echo -e " 4}.$green  Delete SSH & OpenVPN Account"
echo -e " 5}.$green  Check User Login SSH & OpenVPN"
echo -e " 6}.$green  List Member SSH & OpenVPN"
echo -e " 7}.$green  Delete User Expired SSH & OpenVPN"
echo -e " 8}.$green  Set up Autokill SSH"
echo -e " 9}.$green  Cek Users Who Do Multi Login SSH"
echo -e " x}.$red  Exit"
echo -e ""
echo -e "===============================" | lolcat
echo -e "        Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e ""
echo -e "==============================="
read -p "   Please Input Number  [1-9 or [x] ] :  "  menu-ssh
echo -e "==============================="
case $menu-ssh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
delete
;;
5)
cek
;;
6)
member
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
x)
;;
esac
