#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
echo -e ""
echo -e "===============================" | lolcat
echo -e "     Tunggu Sebentar"
echo -e "===============================" | lolcat
echo -e "   Starting Restart All Service"
echo -e "===============================" | lolcat
sleep 1
pkill python
systemctl stop sslh
systemctl daemon-reload
systemctl disable ws-tls
systemctl disable sslh
systemctl daemon-reload
systemctl enable sslh
systemctl enable ws-tls
systemctl stop ws-tls
systemctl start sslh
systemctl restart sslh
/etc/init.d/sslh start
/etc/init.d/sslh restart
systemctl start ws-tls
systemctl start ws-nontls
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart xray.service
service cron restart
systemctl restart ws-ovpn
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
systemctl restart trojan-go

/etc/init.d/ssh restart
/etc/init.d/sslh restart
echo -e "   Starting Restart Ssh Service"
sleep 0.5
/etc/init.d/dropbear restart
echo -e "  Starting Restart Dropbear Service"
sleep 0.5
/etc/init.d/stunnel5 restart
echo -e "  Starting Restart Stunnel Service"
sleep 0.5
/etc/init.d/openvpn restart
echo -e "  Starting Restart openvpn Service"
sleep 0.5
/etc/init.d/fail2ban restart
echo -e "  Starting Restart Fail2ban Service"
sleep 0.5
/etc/init.d/cron restart
echo -e "  Starting Restart Cron Service"
sleep 0.5
/etc/init.d/nginx restart
echo -e "  Starting Restart Nginx Service"
sleep 0.5
/etc/init.d/squid restart
echo -e "  Starting Restart Squid Service"
sleep 0.5
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "===============================" | lolcat
echo -e "  Restart All Service Berhasil"
echo -e "===============================" | lolcat
echo -e "    Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
