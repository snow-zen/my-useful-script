#!/bin/bash

# 替换 Docker-CE 镜像库地址

CONFIG_FILE_PATH="/etc/docker/daemon.json"

fetch_config() {
  # 抓取 daemon.json 配置文件
  #  sudo mkdir -p "$(dirname ${CONFIG_FILE_PATH})"
  sudo curl "https://raw.githubusercontents.com/snow-zen/my-custom-config/master/docker/daemon.json" \
    --create-dirs \
    -o ${CONFIG_FILE_PATH}
}

load_config() {
  # 加载 daemon.json 配置文件
  sudo systemctl daemon-reload
  sudo systemctl restart docker
}

fetch_config
load_config
