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
systemctl enable telegraf

#ip para privoxy
direccion=$(zerotier-cli get af78bf9436b7ddf6 ip)
sed -i "s/ipaddr/$direccion/g" /etc/privoxy/config

