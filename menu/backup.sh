#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
clear
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
mkdir /home/email
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo -e "===============================" | lolcat
echo -e " Masukkan Email Untuk Menerima Backup"
echo -e "===============================" | lolcat
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo -e "===============================" | lolcat
echo -e "      Mohon Tunggu Sebentar ,!!"
echo -e "===============================" | lolcat
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /var/lib/crot/ backup/crot
cp -r /etc/xray backup/xray
cp -r /etc/trojan-go backup/trojan-go
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
===============================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
===============================
        Script By MakhlukVpn          
===============================

    Mohon Simpan File Backup Nya

===============================
echo -e "
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
Detail Backup 
===============================
IP VPS        : ${IP}
Link Backup   : $link
Tanggal       : $date
===============================
  Silahkan cek Kotak Masuk $email
===============================
        Script By MakhlukVpn         
===============================

            Terimakasih Telah
        Menggunakan Layanan Kami

===============================
