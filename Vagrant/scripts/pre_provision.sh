#!/bin/bash
echo 192.168.50.1  demo demo.puppetspecialist.nl >> /etc/hosts
curl -k https://demo.puppetspecialist.nl:8140/packages/current/install.bash | sudo bash
mkdir /data
apt-get update
puppet agent --enable
/vagrant/puppetrun.sh
echo "All done!"
