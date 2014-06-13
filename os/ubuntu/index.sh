#!/usr/bin/env bash

set -e

# Load modules
source "$lib/user/index.sh"
source "$lib/is-ubuntu/index.sh"

# Only run if we're running Ubuntu
if [ 0 -eq `ubuntu` ]; then
  exit 0
fi

# Update ubuntu
sudo aptitude    update
sudo aptitude -y upgrade

# Create a user
while true; do
  read -p "Create a new username (username, no)? " user
  case $user in
    "" | "y" | "yes" ) 
      echo "please enter a new username"
      ;;
    "n" | "no" ) 
      echo "no username created"
      user="root"
      home="/root"
      break
      ;;
    * )
      user add $user
      home="/home/$user"
      break
      ;;
  esac
done

# TODO, reorganize

# Install git and curl
apt-get install -y git curl

# Add public ssh key
mkdir -p $home/.ssh
curl -L "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/85a63f31925ac6e0a6c13826573f3a005c765f10/id_rsa.pub" >> $home/.ssh/authorized_keys
chown -R $user:$user $home/.ssh
chmod 700 $home/.ssh
chmod 600 $home/.ssh/authorized_keys

# Install fail2ban
apt-get install -y fail2ban
curl -L "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/0c6e859ed2ae3cbb2bc87073b96db4954aa74dda/fail2ban.local" > /etc/fail2ban/jail.local
service fail2ban restart

# Setup firewall (needs a newline, because gist cuts them off)
curl -L -w "\n" "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/50f1db72eb2f2278839758c0f54c95d4d4cd5f2d/firewall.rules" > /etc/iptables.firewall.rules
iptables-restore < /etc/iptables.firewall.rules

# Reload the firewall on startup
curl -L "https://gist.github.com/MatthewMueller/38b8dac7b6b35e946822/raw/63b23dd10ff0d163a5aed17bcce9d917284e8541/firewall" > /etc/network/if-pre-up.d/firewall
chmod +x /etc/network/if-pre-up.d/firewall

# Install docker.io
sudo aptitude install linux-image-extra-`uname -r`
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
sudo aptitude    update
sudo aptitude install lxc-docker

# Switch to user
su $user
cd ~
