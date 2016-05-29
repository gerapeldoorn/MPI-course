rsync -r /vagrant/keys /tmp/
puppet agent -t --certdir=/tmp/keys/certs/ --privatekeydir=/tmp/keys/private/ --server demo.puppetspecialist.nl --detailed-exitcodes --environment=ger --noop
echo "Sign cert and press key"
read text
puppet agent -t --certdir=/tmp/keys/certs/ --privatekeydir=/tmp/keys/private/ --server demo.puppetspecialist.nl --detailed-exitcodes --environment=ger --noop
rsync -r /tmp/keys/* /vagrant/keys/
