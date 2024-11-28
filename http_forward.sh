#!/bin/bash

# ===============================
# 配置参数
# ===============================
LOCAL_PORT=8082                # 本地监听端口
REMOTE_PORT=8082               # 远程服务端口
REMOTE_HOST="mll-4090-3.cs.northwestern.edu"  # 远程服务域名/IP

# 确保脚本以 root 权限运行
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit
fi

echo "Starting setup for HTTP Proxy..."

# 更新系统
echo "Updating system packages..."
apt update && apt upgrade -y

# 安装 Node.js 和 npm
echo "Installing Node.js and npm..."
apt install -y nodejs npm curl

# 检查 Node.js 和 npm 是否安装成功
if command -v node > /dev/null && command -v npm > /dev/null; then
  echo "Node.js and npm installed successfully."
else
  echo "Failed to install Node.js or npm. Exiting."
  exit 1
fi

# 创建项目目录
PROJECT_DIR="/opt/http-proxy-server"
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Creating project directory at $PROJECT_DIR..."
  mkdir -p $PROJECT_DIR
else
  echo "Project directory already exists. Skipping creation."
fi

cd $PROJECT_DIR

# 初始化项目并安装依赖
echo "Initializing Node.js project and installing http-proxy..."
npm init -y
npm install http-proxy --save

# 创建代理脚本
PROXY_SCRIPT="proxy.js"
echo "Creating proxy server script at $PROJECT_DIR/$PROXY_SCRIPT..."

cat > $PROXY_SCRIPT <<EOF
const http = require('http');
const httpProxy = require('http-proxy');

// 配置参数
const LOCAL_PORT = ${LOCAL_PORT};
const TARGET = "http://${REMOTE_HOST}:${REMOTE_PORT}";

// 创建一个代理服务器
const proxy = httpProxy.createProxyServer({});

// 本地服务器监听 LOCAL_PORT
const server = http.createServer((req, res) => {
    // 将所有请求代理到目标地址
    proxy.web(req, res, { target: TARGET }, (err) => {
        console.error('Proxy Error:', err);
        res.writeHead(500, { 'Content-Type': 'text/plain' });
        res.end('Proxy Error');
    });
});

server.listen(LOCAL_PORT, () => {
    console.log(\`Proxy server listening on port \${LOCAL_PORT}, forwarding to \${TARGET}\`);
});
EOF

echo "Proxy script created successfully."

# 提示用户是否立即启动代理服务
read -p "Do you want to start the proxy server now? (y/n): " start_now
if [[ "$start_now" =~ ^[Yy]$ ]]; then
  echo "Starting proxy server..."
  node $PROJECT_DIR/$PROXY_SCRIPT &
  echo "Proxy server is running in the background on port $LOCAL_PORT."
  echo "You can access it at http://<your-server-ip>:$LOCAL_PORT"
else
  echo "You can manually start the proxy server by running:"
  echo "node $PROJECT_DIR/$PROXY_SCRIPT"
fi

echo "Setup complete!"
