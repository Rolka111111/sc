#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e "===============================" | lolcat
echo -e "           Menu Cloud Manager  "        
echo -e "===============================" | lolcat
echo -e " 1}.  Backup Data VPS"
echo -e " 2}.  Restore Data VPS"
echo -e " 3}. Menu"
echo -e " 4}. Exit"
echo -e ""
echo -e ""
echo -e "===============================" | lolcat
read -p "    Select From Options [ 1 - 3 or [x] ] : " menu
echo -e "===============================" | lolcat
case $menu in
1)
backup
;;
2)
restore
;;
3)
menu
;;
4)
exit
;;
esac
