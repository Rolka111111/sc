#!/bin/sh
REPOS="https://raw.githubusercontent.com/Annnjayy/sc/main/service/"
echo "====================================" | lolcat
echo "  Installing Cert Cloudflare NSDomain        "
echo "====================================" | lolcat
sleep 1
echo -e "[ ${green}INFO${NC} ] Starting Install NS Cert.... " 
sleep 1
ns_domain_cloudflare() {
	domain=$(cat /etc/xray/domain)
	DOMAIN="makhlukvpn.my.id"
	DOMAIN_PATH=$(cat /etc/xray/domain)
	NS_DOMAIN=ns-${domain}
	CF_ID=makhlukvpn@gmail.com
        CF_KEY=1e1fd5209818f9492309a6c60b94e1df4340f
	set -euo pipefail
	IP=$(wget -qO- ipinfo.io/ip)
	echo "Updating DNS NS for ${NS_DOMAIN}..."
	ZONE=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	RECORD=$(
		curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" | jq -r .result[0].id
	)

	if [[ "${#RECORD}" -le 10 ]]; then
		RECORD=$(
			curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
			-H "X-Auth-Email: ${CF_ID}" \
			-H "X-Auth-Key: ${CF_KEY}" \
			-H "Content-Type: application/json" \
			--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}' | jq -r .result.id
		)
	fi

	RESULT=$(
		curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}'
	)
	echo $NS_DOMAIN >/etc/xray/dns
}

setup_dnstt() {
	mkdir -p /etc/slowdns
    cd /etc/slowdns
	wget -O /etc/slowdns/dnstt-server "${REPOS}dnstt-server" >/dev/null 2>&1
	chmod +x /etc/slowdns/dnstt-server >/dev/null 2>&1
	wget -O /etc/slowdns/dnstt-client "${REPOS}dnstt-client" >/dev/null 2>&1
	chmod +x /etc/slowdns/dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	wget -O /etc/systemd/system/client.service "${REPOS}client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "${REPOS}server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
	cd
}
ns_domain_cloudflare
setup_dnstt
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
iptables-save >/etc/iptables/rules.v4 >/dev/null 2>&1
iptables-save >/etc/iptables.up.rules >/dev/null 2>&1
netfilter-persistent save >/dev/null 2>&1
netfilter-persistent reload >/dev/null 2>&1
systemctl enable iptables >/dev/null 2>&1
systemctl start iptables >/dev/null 2>&1
systemctl restart iptables >/dev/null 2>&1
