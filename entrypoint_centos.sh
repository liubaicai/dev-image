#!/usr/bin/bash

yum update -y

echo root:pass | chpasswd

mkdir -p /root/.ssh
cd /root/.ssh && ssh-keygen -t rsa -N '' -f id_rsa -q && cd /root

echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

/usr/sbin/sshd

/bin/bash