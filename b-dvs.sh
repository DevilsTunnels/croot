#!/bin/bash
###########- COLOR CODE -##############
colornow=$(cat /etc/dvs/theme/color.conf)
NC="\e[0m"
p="\e[0m"
r="\033[0;31m"
y="\033[33m"
gb="\e[92;1m"
RED="\033[0;31m"
grenbo="\e[92;1m"
GRENN="\e[92;1m"
WC='\033[0m'
COLOR1="$(cat /etc/dvs/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/dvs/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

g=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 2)
gb=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 3)
b=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 4)
p=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 5)
r=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 6)
y=$(cat /usr/sbin/mtsc.list | grep "^color" | cut -d " " -f 7)
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Loading..."
repo=https://raw.githubusercontent.com/DevilsTunnels/access/main/name
ipsaya=$(wget -qO- ipinfo.io/ip);
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
useexp=$(wget -qO- ${repo} | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "${r} ╔═════════════════════════════════════════════════╗${p}"
echo -e "${r}═║                ${b}PERMISSION DENIED ${p}               ${r}║═${p}"
echo -e "${r}═║${y}┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┬┬ ┬┌┬┐${p}${r}║═${p}"
echo -e "${r}═║${y}├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   ├─┘├┬┘├┤ │││││ ││││${p}${r}║═${p}"
echo -e "${r}═║${y}┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴  ┴└─└─┘┴ ┴┴└─┘┴ ┴${p}${r}║═${p}"
echo -e "${r}═║${gb}  POWERRED DEVILSTUNNEL | TELEGRAM: @Rizyul04    ${p}${r}║═${p}"
echo -e "${r} ╚═════════════════════════════════════════════════╝${p}"
echo -e "                 ${y}INFORMASI LISENSI${p}"                 
echo -e "${r}═════════════════════════════════════════════════════${p}"
echo -e "                 IP ${r}$ipsaya${p}"
echo -e "                 ${y}PERIZINAN DITOLAK${p}"
echo -e "    ${y} SCRIPT TIDAK BISA DI GUNAKAN DI VPS ANDA${p}"
echo -e "    ${y} SILAHKAN LAKUKAN REGISTRASI TERLEBIH DAHULU${p}"
echo -e "${r}═════════════════════════════════════════════════════${p}"
echo -e "                 ${gb}KONTAK REGISTRASI${p}"
echo -e "   ${gb}|Telegram: @Rizyul04   | WhatsApp: 085163567549|${p}"
echo -e "${r}═════════════════════════════════════════════════════${p}"
exit
fi
checking_sc
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget -q https://raw.githubusercontent.com/DevilsTunnels/dvs/main/last/tunnel.zip
unzip tunnel.zip
mv tunnel/* /usr/bin
chmod +x /usr/bin/*
rm -rf tunnel.zip
clear
wget -q https://raw.githubusercontent.com/DevilsTunnels/croot/main/last/devils.zip
unzip devils.zip
pip3 install -r devils/requirements.txt

#isi data
echo ""
echo -e "$COLOR1╔══════════════════════════════════════════╗$NC"
echo -e " $COLBG1        ${WH}⇱ ADD BOT PANEL⇲${NC}        $NC"
echo -e "$COLOR1╚══════════════════════════════════════════╝$NC"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "$COLOR1 ══════════════════════════════════════════$NC"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/devils/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/devils/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/devils/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/devils/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/devils/var.txt
clear

cat > /etc/systemd/system/devils.service << END
[Unit]
Description=Simple Bot Devils - @Rizyul04
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m devils
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start devils
systemctl enable devils
systemctl restart devils
cd /root
rm -rf dvs.sh
echo "Done"
echo "Your Data Bot"
echo -e "═════════════════════════════"
echo "Token Bot : $bottoken"
echo "Admin     : $admin"
echo "Domain    : $domain"
echo "Pub       : $PUB"
echo "Host      : $NS"
echo -e "═════════════════════════════"
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
