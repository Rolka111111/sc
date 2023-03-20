#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
#installing
apt install lolcat -y
echo "====================================" | lolcat
echo "  Installing AutoScript            "
echo "====================================" | lolcat
sleep 2
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
# info script install
if [ -f "/etc/xray/domain" ]; then
echo -e "===============================" | lolcat
echo -e "   Script Already Installed"
echo -e "===============================" | lolcat
exit 0
fi
# istall script
mkdir /root/.s
echo -e "===============================" | lolcat
read -rp "Nama/Pengguna : " -e nama
echo -e "===============================" | lolcat
echo $nama > /root/.s/pengguna
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
#ip saya
wget https://${service}/ipsaya.sh && chmod +x ipsaya.sh
# install cloudflare certificate
wget https://${service}/cf.sh
bash cf.sh
# install xray
wget https://${instal}/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
#install all service
wget https://${instal}/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
# Websocket
wget https://${instal}/ssh-ws.sh && chmod +x ssh-ws.sh && ./ssh-ws.sh
# Ohp Server
wget https://${instal}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
# install openvpn
wget https://${instal}/vpn.sh && bash vpn.sh
# install tool
wget https://${instal}/tool.sh && bash tool.sh
#install xray certificate cloudflare
wget https://${menu}/certv2ray.sh
bash certv2ray.sh
# install slowdns cloudflare certificate
wget https://${instal}/nscf.sh
bash nscf.sh

#delete sc yang sudah terinstall
rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsaya.sh
rm -f /root/ssh-ws.sh
rm -f /root/ohp.sh
rm -f /root/nscf.sh
rm -f /root/tool.sh
rm -f /root/certv2ray.sh
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
wget -O /etc/set.sh "https://${service}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"
echo " "
echo "================ {Service & Port} =================" | tee -a log-install.txt | lolcat
echo ""
echo "   - OpenSSH                  : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                  : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                  : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy               : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                    : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                     : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS          : 443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS     : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan TLS         : 2083"  | tee -a log-install.txt
echo "   - XRAYS Trojan None TLS    : 2087"  | tee -a log-install.txt
echo "   - Websocket TLS             : 443, "  | tee -a log-install.txt
echo "   - Websocket None TLS       : 80, "  | tee -a log-install.txt
echo "   - Websocket Ovpn            : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                  : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear              : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN              : 8383"  | tee -a log-install.txt
echo "   - SLOWDNS OpenSSH         : 2253 "  | tee -a log-install.txt
echo "   - SLOWDNS Dropbear         : 1153 "  | tee -a log-install.txt
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
echo ""
echo "============= {Script Created By MakhlukVpn} ============" | tee -a log-install.txt | lolcat
echo ""
echo " Reboot 10 Sec"
sleep 10
rm -f setup.sh
reboot
