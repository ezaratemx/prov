#zerotier
curl -s https://install.zerotier.com | bash
zerotier-cli join af78bf9436b7ddf6
sleep 1m

#ip para privoxy
direccion=$(zerotier-cli get af78bf9436b7ddf6 ip)
sed -i "s/ipaddr/$direccion/g" /etc/privoxy/config
apt install ufw
sudo ufw enable
ufw allow from 10.241.0.0/16 to any port 22
ufw allow from 10.241.0.0/16 to any port 8118
