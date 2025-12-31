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

exec /bin/bash