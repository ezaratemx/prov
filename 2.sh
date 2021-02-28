
# At this point, either log out and log in again, or reboot.
# Rebooting seems easier if this is really being run from fabric.
# If you do any upgrades, you may have to run the locale commands again

# Set timezone to America/Mexico_City
#cp /etc/timezone /etc/timezone.dist
wget https://raw.githubusercontent.com/ezaratemx/prov/main/timezone.txt
rm etc/timezone
mv timezone /etc/timezone
#echo "America/Mexico_City" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

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
direccion=$(sudo zerotier-cli get af78bf9436b7ddf6 ip)
sed -i "s/ipaddr/$direccion/g" /etc/privoxy/config
