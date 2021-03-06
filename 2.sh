#zerotier
curl -s https://install.zerotier.com | bash

#privoxy
apt install -y privoxy

#telegraf
curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list
apt-get update
apt-get install -y telegraf
usermod -G video telegraf
mv telegraf.conf /etc/telegraf/telegraf.conf
systemctl enable telegraf

#ip para privoxy
direccion=$(zerotier-cli get af78bf9436b7ddf6 ip)
sed -i "s/ipaddr/$direccion/g" /etc/privoxy/config
apt install ufw
sudo ufw enable
ufw allow from 10.241.0.0/16 to any port 22
ufw allow from 10.241.0.0/16 to any port 8118
