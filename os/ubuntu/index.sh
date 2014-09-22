#!/usr/bin/env bash

set -e

# Load modules
source "$lib/user/index.sh"
source "$lib/is-ubuntu/index.sh"

# Only run if we're running Ubuntu
if [ 0 -eq `ubuntu` ]; then
  exit 0
fi

# Add sources
curl https://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

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

# Secure SSH and remove root access
sudo sed -i.bak \
  -e 's/^#PermitRootLogin yes/PermitRootLogin no/' \
  -e 's/PermitRootLogin yes/PermitRootLogin no/' \
  -e 's/^#PermitEmptyPasswords yes/PermitEmptyPasswords no/' \
  -e 's/PermitEmptyPasswords yes/PermitEmptyPasswords no/' \
  -e 's/^#PasswordAuthentication yes/PasswordAuthentication no/' \
  -e 's/PasswordAuthentication yes/PasswordAuthentication no/' \
  -e 's/^#X11Forwarding yes/X11Forwarding no/' \
  -e 's/X11Forwarding yes/X11Forwarding no/' \
  /etc/ssh/sshd_config

# Install docker.io
sudo aptitude install lxc-docker

# Switch to user
cd $home
su $user
