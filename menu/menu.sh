#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
# isp
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
COUNTRY=$( curl -s ipinfo.io/country )
Name="$(cat /root/.s/pengguna)"
# os
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Total Ram
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
# Ram Usage
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))
# Getting Domain Name
MYIP=$(wget -qO- icanhazip.com);
Domen="$(cat /etc/xray/domain)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

echo -e ""
echo -e "===============================" | lolcat
echo -e "     ⇱ Sytem Information ⇲           "
echo -e "===============================" | lolcat
echo -e "# OS Name     : $Tipe , $Versi_OS"
echo -e "# Cpu Usage    : $cpu_usage"
echo -e "# Total RAM    : ${totalram}MB"
echo -e "# Avaible       : ${MEMORY}MB"
echo -e "# Public IP      : $MYIP"
echo -e "# Domain       : $Domen"
echo -e "# ISP Country   : $NAMAISP , $COUNTRY"
echo -e "===============================" | lolcat
echo -e "     ⇱ Menu Manager ⇲ "        
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
echo -e "=====================================" | lolcat
echo -e "# Total Download    : $downloadsize GB "
echo -e "# Total Upload      : $uploadsize GB "
echo -e "# Client Name       : $Name"
echo -e "# Exp Script        : $Exp"
echo -e "# Version           : V.1 {latest}"
echo -e "===============================" | lolcat
echo -e "   Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
echo -e ""
echo -e "===============================" | lolcat
read -p "  Please Input Number  [1-10 or [x] ] :  "  menu
echo -e "===============================" | lolcat
case $menu in
1)
menu-ssh
;;
2)
menu-xray
;;
3)
menu-tro
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
st
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
