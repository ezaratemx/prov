systemctl enable ssh
systemctl start ssh
apt update
apt upgrade -y
apt autoremove -y

sh -c 'cat /sys/class/net/eth0/address | sed s/://g > /etc/hostname'

# Set locale to en_US.UTF-8
cp /etc/locale.gen /etc/locale.gen.dist
sed -i -e "/^[^#]/s/^/#/" -e "/en_US.UTF-8/s/^#//" /etc/locale.gen

cp /var/cache/debconf/config.dat /var/cache/debconf/config.dat.dist
sed -i -e "/^Value: en_GB.UTF-8/s/en_GB/en_US/" \
       -e "/^ locales = en_GB.UTF-8/s/en_GB/en_US/" /var/cache/debconf/config.dat
locale-gen
update-locale LANG=en_US.UTF-8
wget https://raw.githubusercontent.com/ezaratemx/prov/main/2.sh
chmod +x 2.sh
reboot
