#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "===============================" | lolcat
echo -e "$ Permission Accepted..."
echo -e "===============================" | lolcat
else
echo -e "===============================" | lolcat
echo -e "$ Permission Denied!"
echo -e "===============================" | lolcat
exit 0
fi
clear
echo -e "===============================" | lolcat
read -p "  Username SSH to Delete : " Pengguna
if getent passwd $Pengguna > /dev/null 2>&1; then
userdel $Pengguna
echo -e "===============================" | lolcat
echo -e "      Succesfully "
echo -e "===============================" | lolcat
echo -e "  Username $Pengguna Telah Di Hapus"
echo -e "===============================" | lolcat
echo -e "     Script By MakhlukVpn  "
echo -e "===============================" | lolcat
fi