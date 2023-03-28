#!/bin/bash
clear
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo -n > /tmp/other.txt
data=( `cat /etc/xray/vless-tls.json | grep '^####' | cut -d ' ' -f 2`);
echo -e "===============================" | lolcat
echo -e "      Vless User Login            "
echo -e "===============================" | lolcat
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "user : $akun";
echo "$jum2";
echo -e "===============================" | lolcat
fi
rm -rf /tmp/ipvless.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "other";
echo "$oth";
echo -e "===============================" | lolcat
echo -e "     Script By MakhlukVpn          "
echo -e "===============================" | lolcat
echo -e ""
rm -rf /tmp/other.txt

