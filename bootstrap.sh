#!/usr/bin/env bash
set -x
sudo su -
/usr/bin/yum update -y
cd /tmp
yum install git -y
curl -O https://raw.githubusercontent.com/shaikis/terraform-aws-OpenVpn/main/bash_scripts/userdata.sh
chmod +x userdata.sh
export AUTO_INSTALL=y
./userdata.sh


##! /bin/bash
#apt-get update
#curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
#chmod +x openvpn-install.sh
#APPROVE_INSTALL=y ENDPOINT=$(curl -4 ifconfig.co) APPROVE_IP=y IPV6_SUPPORT=n PORT_CHOICE=1 PROTOCOL_CHOICE=1 DNS=1 COMPRESSION_ENABLED=n  CUSTOMIZE_ENC=n CLIENT=openvpn PASS=1 ./openvpn-install.sh
#mv /root/openvpn.ovpn /tmp/
#chown ubuntu: /tmp/openvpn.ovpn
#chmod 777 /tmp/openvpn.ovpn
#sudo snap start amazon-ssm-agent
