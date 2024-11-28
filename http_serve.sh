#!/bin/bash

# ===============================
# 配置参数
# ===============================
SHARE_DIR="/path/to/your/folder"  # 要共享的文件夹路径
PORT=8000                         # 服务监听端口

cd "$SHARE_DIR"
python3 -m http.server "$PORT"