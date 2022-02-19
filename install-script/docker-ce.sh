#!/bin/bash

# Docker-CE 安装脚本

remove_old_docker() {
    # 删除旧版本 Docker
    sudo apt-get remove docker docker-engine docker.io
}

add_docker_repo_gpg_key() {
    # 信任 Docker 的 GPG 公钥
    curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | sudo apt-key add -
}

add_docker_repo() {
    # 添加 Docker-CE 软件库
    add_docker_repo_gpg_key

    sudo add-apt-repository \ 
        "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
}

install_docker_ce() {
    sudo apt-get update
    # 安装前置依赖
    sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    sudo apt-get install docker-ce
}

remove_old_docker
add_docker_repo
install_docker_ce