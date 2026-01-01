# Dev Image

基于 Debian 12 的开发环境镜像，提供两个版本：

## 版本说明

### 1. 标准版 (Dockerfile)

轻量级命令行开发环境，包含：
- Debian 12 基础系统
- SSH 服务器
- Git、Curl、Vim 等基础工具
- Node.js 22.x
- Oh My Bash

### 2. 桌面版 (Dockerfile.desktop)

在标准版基础上增加了图形桌面环境，包含：
- XFCE4 桌面环境
- VNC 服务器 (TigerVNC)
- Firefox ESR 浏览器
- 通过 VNC 远程访问桌面

## 使用方法

### 标准版

```bash
# 构建镜像
docker build -t dev-image .

# 运行容器
docker run -d -p 2222:22 --name dev-container dev-image

# SSH 连接
ssh root@localhost -p 2222
# 默认密码: pass (可通过 ROOT_PASSWORD 环境变量修改)
```

### 桌面版

```bash
# 构建镜像
docker build -f Dockerfile.desktop -t dev-image-desktop .

# 运行容器
docker run -d -p 2222:22 -p 5901:5901 --name dev-desktop dev-image-desktop

# VNC 连接
# 使用 VNC 客户端连接到 localhost:5901
# 默认密码: pass (可通过 VNC_PASSWORD 环境变量修改)

# SSH 连接（同标准版）
ssh root@localhost -p 2222
```

### 环境变量

- `ROOT_PASSWORD`: 设置 root 用户密码（默认：pass）
- `VNC_PASSWORD`: 设置 VNC 访问密码（仅桌面版，默认：pass）

### 示例：自定义密码

```bash
docker run -d \
  -p 2222:22 \
  -p 5901:5901 \
  -e ROOT_PASSWORD=mypassword \
  -e VNC_PASSWORD=vncpassword \
  --name dev-desktop \
  dev-image-desktop
```

## 功能特性

- ✅ 中国时区 (Asia/Shanghai)
- ✅ 使用阿里云镜像源加速
- ✅ SSH 服务自动启动
- ✅ 自动生成 SSH 密钥对
- ✅ VNC 远程桌面 (仅桌面版)
- ✅ 持久化工作目录 /root/workspace

## 端口说明

- `22`: SSH 服务端口
- `5901`: VNC 服务端口 (仅桌面版)

## 注意事项

1. 默认密码为 `pass`，生产环境中请务必修改
2. 容器首次启动时会生成 SSH 密钥对
3. VNC 桌面分辨率默认为 1920x1080，可在 entrypoint-desktop.sh 中修改
4. 建议挂载 /root/workspace 目录以持久化数据

## Docker Hub

- 标准版: `liubaicai/dev`
- 桌面版: `liubaicai/dev-desktop`
