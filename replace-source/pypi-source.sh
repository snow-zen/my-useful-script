#!/bin/bash

# 替换 pypi 镜像库地址

MIRROR_URI="https://pypi.tuna.tsinghua.edu.cn/simple"

python3 -m pip install --upgrade pip
python3 -m pip config set global.index-url ${MIRROR_URI}
