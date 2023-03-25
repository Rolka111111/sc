# sc Testing🗿
# Update
````
apt update -y && apt upgrade -y && update-grub && sleep 2 && reboot
````
# Permision
````
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1
````
# Install
````
apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/Annnjayy/sc/main/setup.sh && bash setup.sh
````
# Os Supported

• Debian 10 & 9

• Ubuntu 18.04 & 20.04

# Service & Port

• OpenSSH                   : 22, 2253

• Dropbear                  : 443, 109, 143, 1153

• Stunnel5                  : 443, 445, 777

• OpenVPN                   : TCP 1194, UDP 2200, SSL 990

• Websocket SSH TLS         : 443

• Websocket SSH HTTP        : 80

• Websocket OpenVPN         : 2086

• Squid Proxy               : 3128, 8080

• Badvpn                    : 7100, 7200, 7300

• Nginx                     : 89

• Wireguard                 : 7070

• L2TP/IPSEC VPN            : 1701

• PPTP VPN                  : 1732

• SSTP VPN                  : 444

• Shadowsocks-R             : 1443-1543

• SS-OBFS TLS               : 2443-2543

• SS-OBFS HTTP              : 3443-3543

• XRAYS Vmess TLS           : 443

• XRAYS Vmess None TLS      : 80

• XRAYS Vless TLS           : 443

• XRAYS Vless None TLS      : 80

• XRAYS Trojan              : 2083

• XRAYS Vmess GRPC TLS      : 1180,3380

• XRAYS Vless GRPC TLS      : 2280,4480

• OHP SSH                   : 8181

• OHP Dropbear              : 8282

• OHP OpenVPN               : 8383

• Trojan Go                 : 2087

• SlowDNS                   : [OFF]

• CloudFront Over Websocket : [OFF]


 ### Server Information & Other Features

• Timezone                : Asia/Jakarta (GMT +7)

• Fail2Ban                : [ON]

• Dflate                  : [ON]

• IPtables                : [ON]

• Auto-Reboot             : [ON]

• IPv6                    : [OFF]
