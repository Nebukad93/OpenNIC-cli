#!/bin/bash
#Getting the nearest OpenNIC servers using the geopi API
read ns1 ns2 <<< $(curl -s https://api.opennicproject.org/geoip/ | head -2 | awk '{print $1}')
sudo chattr -i /etc/resolv.conf #Allow the modification of the file
sed -i 's|nameserver|#nameserver|' /etc/resolv.conf #Disable previous DNS servers
echo "nameserver $ns1
nameserver $ns2" >> /etc/resolv.conf #Set the DNS servers
sudo chattr +i /etc/resolv.conf #Disallow the modification of the file