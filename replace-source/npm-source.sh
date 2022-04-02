#!/bin/bash

# 替换 npm 镜像地址

NPM_REGISTRY_URL="https://registry.npmmirror.com"

if ! command -v npm >/dev/null 2>&1; then
  echo "npm 命令不存在，请检查是否安装 npm 或者执行文件是否在 PATH 路径下。"
  exit 1
fi

npm config set registry "${NPM_REGISTRY_URL}"
echo "npm 镜像地址切换成功，镜像地址为 ${NPM_REGISTRY_URL}"
