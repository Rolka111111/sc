#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo "===================================="
echo "   Installing AutoScript            "
echo "===================================="
sleep 0.5
echo Processing...
sleep 0.5
# Link Hosting Kalian Untuk Tool
ssh="raw.githubusercontent.com/Annnjayy/sc/main/ssh"
# Link Hosting Kalian Untuk Xray
xray="raw.githubusercontent.com/Annnjayy/sc/main/xray"
# Link Hosting Kalian Untuk Service
service="raw.githubusercontent.com/Annnjayy/sc/main/service"
# Link Hosting Kalian Untuk Menu
menu="raw.githubusercontent.com/Annnjayy/sc/main/menu"
#Link Hosting Kalian Untuk Install
instal="raw.githubusercontent.com/Annnjayy/sc/main/install"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
# install cloudflare certificate
wget https://${service}/cf.sh && chmod +x cf.sh && ./cf.sh
# install xray
wget https://${instal}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://${instal}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
# Websocket
wget https://${instal}/ssh-ws.sh && chmod +x ssh-ws.sh && ./ssh-ws.sh
# Ohp Server
wget https://${instal}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
 wget https://${service}/ipsaya.sh && chmod +x ipsaya.sh
# install xray grpc
wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/sl-grpc.sh && chmod +x sl-grpc.sh && screen -S sl-grpc ./sl-grpc.sh
# install slowdns cloudflare certificate
wget https://${service}/nscf.sh && chmod +x nscf.sh && ./nscf.sh

#delete sc yabg sudah terinstall
rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsaya.sh
rm -f /root/ssh-ws.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=nekopoi.care

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget --output-document=/etc/set.sh "https://${service}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "================ {Service & Port} =================" | tee -a log-install.txt | lolcat
echo ""
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 443, 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80, 8880"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443, 8443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 80, 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo "   - SLOWDNS OpenSSH         : 2253 "  | tee -a log-install.txt
echo "   - SLOWDNS Dropbear        : 1153 "  | tee -a log-install.txt
echo "   - SLOWDNS SSL/TLS         : 3353 "  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""
echo "============= {Server Information & Other Features} ==========="  | tee -a log-install.txt | lolcat
echo ""
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                 : [ON]"  | tee -a log-install.txt
echo "   - Dflate                   : [ON]"  | tee -a log-install.txt
echo "   - IPtables                 : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo "   - Dev/Main                : MakhlukVpn"  | tee -a log-install.txt
echo "   - Telegram                 : t.me/MakhlukVpn"  | tee -a log-install.txt
#echo "   - Instagram               : @senowahyu62"  | tee -a log-install.txt
#echo "   - Whatsapp                : 082220155143"  | tee -a log-install.txt
#echo "   - Facebook                : https://www.facebook.com/senowahyu62" | tee -a log-install.txt
echo ""
echo "============= {Script Created By MakhlukVpn} ============" | tee -a log-install.txt | lolcat
echo ""
echo " Reboot 10 Sec"
sleep 10
rm -f setup.sh
reboot

