#echo "America/Mexico_City" > /etc/timezone
timedatectl set-timezone America/Mexico_City
# Set the keyboard to US, don't set any modifier keys, etc.
#cp /etc/default/keyboard /etc/default/keyboard.dist
#sed -i -e "/XKBLAYOUT=/s/gb/us/" /etc/default/keyboard
#service keyboard-setup restart

#zerotier
curl -s https://install.zerotier.com | bash

#privoxy
apt install -y privoxy

#telegraf
curl -sL https://repos.influxdata.com/influxdb.key | apt-key add -
echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list

apt-get update
apt-get install -y telegraf
systemctl enable telegraf
#systemctl start telegraf
