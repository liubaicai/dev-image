#!/usr/bin/env bash

set -e

# 设置 root 密码（建议通过环境变量传入）
ROOT_PASSWORD=${ROOT_PASSWORD:-pass}
echo "root:${ROOT_PASSWORD}" | chpasswd

# 仅在密钥不存在时生成 SSH 密钥
if [ ! -f /root/.ssh/id_rsa ]; then
    mkdir -p /root/.ssh
    ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa -q
fi

# 配置 SSH 服务（使用 sed 避免重复追加）
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 启动 SSH 服务
mkdir -p /run/sshd
/usr/sbin/sshd

echo "===> Please copy the following public key to your server:"
cat /root/.ssh/id_rsa.pub

# 设置 VNC 密码（如果提供了 VNC_PASSWORD 环境变量）
VNC_PASSWORD=${VNC_PASSWORD:-pass}
mkdir -p /root/.vnc
echo "${VNC_PASSWORD}" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# 启动 VNC 服务器
echo "===> Starting VNC server on display :1 (port 5901)"
vncserver :1 -localhost no -geometry 1920x1080 -depth 24

echo "===> VNC server started. Connect using VNC viewer to <host>:5901"
echo "===> VNC password: ${VNC_PASSWORD}"
echo "===> SSH is also available on port 22"

exec /bin/bash
