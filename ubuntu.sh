#!/bin/bash

# 设置 Ubuntu 中软件源镜像配置

SOURCES_LIST="/etc/apt/sources.list"

setting_mirror() {
    # 复制远程自定义 Ubuntu 软件源镜像配置并设置
    curl "https://raw.githubusercontents.com/snow-zen/my-custom-config/master/ubuntu/sources.list" -o "${SOURCES_LIST}"
}

backup_origin_config() {
    if [ -e "${SOURCES_LIST}" ]
    then
        cp "${SOURCES_LIST}" "${SOURCES_LIST}.origin"
    fi
}

backup_origin_config
setting_mirror