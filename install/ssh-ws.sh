#!/bin/bash
# Proxy For Ssh & Ovpn Websocket
echo "===================================="
echo "           Installing Websocket-SSH          "
echo "===================================="
sleep 0.5
echo Processing...
sleep 0.5
# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://raw.githubusercontent.com/Annnjayy/sc/install/main/ws-ntls.py
wget -q -O /usr/local/bin/ws-tls https://raw.githubusercontent.com/Annnjayy/sc/install/main/ws-tls.py
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/Annnjayy/sc/install/main/ws-ovpn.py
chmod +x /usr/local/bin/ws-ntls.py
chmod +x /usr/local/bin/ws-tls.py
chmod +x /usr/local/bin/ws-ovpn.py

# Installing Service ws nontls
cat > /etc/systemd/system/sshws-nontls.service << END
[Unit]
Description=SSH Websocket By MakhlukVpn
Documentation=https://nekopi.care
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 80
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable sshws-nontls
systemctl restart sshws-nontls

# Installing Service ws tls
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=SSH Websocket By MakhlukVpn
Documentation=https://nekopoi.care
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By LamVpn
Documentation=https://nekopoi.care
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn

clear
echo -e "==============================="
echo -e "  Done Install Ssh & Ovpn Websocket  "
echo -e "==============================="
echo -e "       PORT SSH NONTLS : 80        "
echo -e "       PORT SSH TLS    : 443        "
echo -e "       PORT OVPN WS B  : 2086      "
echo -e "==============================="
echo -e "        Script By MakhlukVpn          "
echo -e "==============================="
sleep 1