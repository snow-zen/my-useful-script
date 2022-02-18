#!/bin/bash

# 设置 Ubuntu 中软件源镜像配置

SOURCES_LIST="/etc/apt/sources.list"

setting_mirror() {
    # 复制远程自定义 Ubuntu 软件源镜像配置并设置
    curl "https://raw.githubusercontents.com/snow-zen/my-custom-config/master/ubuntu/sources.list" --create-dirs -o "${SOURCES_LIST}"
}

backup_origin_config() {
    # 只有当配置文件存在时，备份原有配置文件
    if [ -e "${SOURCES_LIST}" ]
    then
        cp "${SOURCES_LIST}" "${SOURCES_LIST}.origin"
    fi
}

if [[ "$(uname -v)" != *"Ubuntu"* ]]
then 
    echo "当前系统不是 Ubuntu，请在 Ubuntu 系统上执行该脚本。当前系统信息：$(uname -v)"
    exit 1
fi

backup_origin_config
setting_mirror