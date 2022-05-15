#!/bin/bash

# @description 设置 git 配置信息
# author snow-zen

set_username_and_email() {
  read -p "请输入用户名称（user.name）：" -r username
  read -p "请输入用户邮箱（user.email）：" -r email
  read -p "是否为全局设置？[y/n]：" -r global

  case "$global" in
  [yY]*)
    git config --global user.name "$username"
    git config --global user.email "$email"
    ;;
  [nN]*)
    git config user.name "$username"
    git config user.email "$email"
    ;;
  *)
    echo "输入错误"
    exit 1
    ;;
  esac
}

parse_chinese_path() {
  git config --global core.quotepath false
}

set_username_and_email
parse_chinese_path
