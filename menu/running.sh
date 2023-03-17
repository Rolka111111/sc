#!/bin/bash
# IP Validation
MYIP=$(wget -qO- icanhazip.com);

# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
clear
REGION=$( curl -s ipinfo.io/region )
clear
COUNTRY=$( curl -s ipinfo.io/country )
clear
WAKTU=$( curl -s ipinfo.ip/timezone )
clear
CITY=$( curl -s ipinfo.io/city )
clear
REGION=$( curl -s ipinfo.io/region )
clear
koordinat=$( curl -s ipinfo.io/loc )
clear
NC='\033[0m'
echo -e "$NC"

# Chek Status 
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
#status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
tls_v2ray_status=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status v2ray@none | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status v2ray@vless | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status v2ray@vnone | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# Color Validation
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# Status Service OpenVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}OpenVPN Service Is Running ${NC}( Aktif )"
else
  status_openvpn="${RED}OpenVPN Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}SSH/Tunnel Service Is Running ${NC}( Aktif )"
else
   status_ssh="${RED}SSH/Tunnel Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Squid 
if [[ $squid_service == "running" ]]; then 
   status_squid="${GREEN}Squid Service Is Running ${NC}( Aktif )"
else
   status_squid="${RED}Squid Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}Vnstat Service Is Running ${NC}( Aktif )"
else
   status_vnstat="${RED}Vnstat Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Crons 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}Crons Service Is Running ${NC}( Aktif )"
else
   status_cron="${RED}Crons Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Fail2ban 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}Fail2Ban Service Is Running ${NC}( Aktif )"
else
   status_fail2ban="${RED}Fail2Ban Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GREEN}V2Ray HTTPS Service Is Running${NC} ( Aktif )"
else
   status_tls_v2ray="${RED}V2Ray HTTPS Service Is Not Running${NC} ( Not Aktif )"
fi

# Status Service Non TLS V2Ray
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GREEN}V2Ray HTTP Service Is Running ${NC}( Aktif )${NC}"
else
   status_nontls_v2ray="${RED}V2Ray HTTP Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Vless HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless="${GREEN}Vless HTTPS Service Is Running${NC} ( Aktif )"
else
  status_tls_vless="${RED}Vless HTTPS Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Vless HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless="${GREEN}Vless HTTP Service Is Running${NC} ( Aktif )"
else
  status_nontls_vless="${RED}Vless HTTP Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Trojan
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan="${GREEN}Trojan Service Is Running ${NC}( Aktif )${NC}"
else
   status_virus_trojan="${RED}Trojan Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Dropbear
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}Dropbear Service Is Running${NC} ( Aktif )${NC}"
else
   status_beruangjatuh="${RED}Dropbear Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Stunnel
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}Stunnel Service Is Running ${NC}( Aktif )"
else
   status_stunnel="${RED}Stunnel Service Is Not Running ${NC}( Not Aktif )}"
fi

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# Echoing Result
echo -e "=====================================" | lolcat 
echo -e "    Time Information "
echo -e "=====================================" | lolcat
echo -e "Location    : $COUNTRY"
echo -e "Coordinate  : $koordinat"
echo -e "Time Zone   : $WAKTU"
echo -e "Date        : $harini"
echo -e "Time        : $jam ( WIB )"
echo -e "=====================================" | lolcat
echo -e "    System Status Information"
echo -e "=====================================" | lolcat
echo -e "SSH / Tun   : $status_ssh"
echo -e "OpenVPN     : $status_openvpn"
echo -e "Dropbear    : $status_beruangjatuh"
echo -e "Stunnel     : $status_stunnel"
echo -e "Squid       : $status_squid"
echo -e "Fail2Ban    : $status_fail2ban"
echo -e "Crons       : $status_cron"
echo -e "Vnstat      : $status_vnstat"
echo -e "V2Ray TLS   : $status_tls_v2ray"
echo -e "V2Ray HTTP  : $status_nontls_v2ray"
echo -e "Vless TLS   : $status_tls_vless"
echo -e "Vless HTTP  : $status_nontls_vless"
echo -e "Trojan      : $status_virus_trojan"
echo -e "=====================================" | lolcat
echo -e "    Script By MakhlukVpn          "
echo -e "=====================================" | lolcat
echo -e ""
echo -e "        Terimakasih Telah "
echo -e "    Menggunakan Layanan Kami "
echo -e ""
echo -e "=====================================" | lolcat

