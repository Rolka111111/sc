#!/bin/bash
clear
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
#link
cd /usr/bin
wget --output-document=addhost "https://${menu}/addhost.sh"
wget --output-document=slhost "https://${service}/cf.sh"
wget --output-document=about "https://${menu}/about.sh"
wget --output-document=menu "https://${menu}/menu.sh"
wget --output-document=usernew "https://${ssh}/usernew.sh"
wget --output-document=renew "https://${ssh}/renew.sh"
wget --output-document=trial "https://${ssh}/trial.sh"
wget --output-document=delete "https://${ssh}/delete.sh"
wget --output-document=member "https://${ssh}/member.sh"
wget --output-document=delexp "https://${ssh}/delexp.sh"
wget --output-document=running "https://${service}/running.sh"
wget --output-document=restart "https://${menu}/restart.sh"
wget --output-document=usernew "https://${ssh}/usernew.sh"
wget --output-document=autokill "https://${ssh}/autokill.sh"
wget --output-document=ceklim "https://${ssh}/ceklim.sh"
wget --output-document=tendang "https://${service}/tendang.sh"
wget --output-document=clearlog "https://${service}/clearlog.sh"
wget --output-document=xp "https://${service}/xp.sh"
wget --output-document=swapkvm "https://${service}/swapkvm.sh"
wget --output-document=addvmess "https://${xray}/addvmess.sh"
wget --output-document=addvless "https://${xray}/addvless.sh"
wget --output-document=addtrojan "https://${xray}/addtrojan.sh"
wget --output-document=backup "https://${menu}/backup.sh"
wget --output-document=restore "https://${menu}/restore.sh"
wget --output-document=menu-trojan "https://${menu}/menu-trojan.sh"
wget --output-document=menu-ssh "https://${menu}/menu-ssh.sh"
wget --output-document=menu-xray "https://${menu}/menu-xray.sh"
wget --output-document=menu-cloud "https://${menu}/menu-cloud.sh"
wget --output-document=delvmess "https://${xray}/delvmess.sh"
wget --output-document=delvless "https://${xray}/delvless.sh"
wget --output-document=deltrojan "https://${xray}/deltrojan.sh"
wget --output-document=cekvmess "https://${xray}/cekvmess.sh"
wget --output-document=cekvless "https://${xray}/cekvless.sh"
wget --output-document=cektrojan "https://${xray}/cektrojan.sh"
wget --output-document=renewvmess "https://${xray}/renewvmess.sh"
wget --output-document=renewvless "https://${xray}/renewvless.sh"
wget --output-document=renewtrojan "https://${xray}/renewtrojan.sh"
wget --output-document=certv2ray "https://${menu}/certv2ray.sh"
wget --output-document=ipsaya "https://${service}/ipsaya.sh"
chmod +x backup
chmod +x restore
chmod +x ipsaya
chmod +x menu-xray
chmod +x menu-trojan
chmod +x menu-cloud
chmod +x menu-ssh
chmod +x running
chmod +x slhost
chmod +x addhost
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x delete
chmod +x member
chmod +x delexp
chmod +x restart
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x renew
chmod +x clearlog
chmod +x wbmn
chmod +x xp
chmod +x swapkvm
chmod +x addvmess
chmod +x addvless
chmod +x addtrojan
chmod +x delvmess
chmod +x delvless
chmod +x deltrojan
chmod +x cekvmess
chmod +x cekvless
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray

echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "10 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
echo "0 0 * * * root clearlog && reboot" >> /etc/crontab
echo "0 12 * * * root clearlog && reboot" >> /etc/crontab
echo "0 18 * * * root clearlog && reboot" >> /etc/crontab
