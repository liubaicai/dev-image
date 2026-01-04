# Dev Image

基于 Debian 12 的开发环境镜像

## 使用方法

```bash
# 构建镜像
docker build -t dev-image .

# 运行容器
docker run -d -p 2222:22 --name dev-container dev-image

# SSH 连接
ssh root@localhost -p 2222
# 默认密码: pass (可通过 ROOT_PASSWORD 环境变量修改)
```

### 环境变量

- `ROOT_PASSWORD`: 设置 root 用户密码（默认：pass）

### 示例：自定义密码

```bash
docker run -d \
  -p 2222:22 \
  -e ROOT_PASSWORD=mypassword \
  --name dev-container \
  dev-image
```

## 功能特性

- ✅ Debian 12 基础系统
- ✅ SSH 服务器
- ✅ Git、Curl、Vim 等基础工具
- ✅ Node.js 22.x
- ✅ Oh My Bash
- ✅ 中国时区 (Asia/Shanghai)
- ✅ 使用阿里云镜像源加速
- ✅ SSH 服务自动启动
- ✅ 自动生成 SSH 密钥对
- ✅ 持久化工作目录 /root/workspace

## 端口说明

- `22`: SSH 服务端口

## 注意事项

1. 默认密码为 `pass`，生产环境中请务必修改
2. 容器首次启动时会生成 SSH 密钥对
3. 建议挂载 /root/workspace 目录以持久化数据

## Docker Hub

- 镜像: `liubaicai/dev`
