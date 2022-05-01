#!/bin/bash

# @description 设置 Github DNS 解析，脚本参考：https://stackoverflow.com/questions/19339248/append-line-to-etc-hosts-file-with-shell-script
# @author snow-zen

IP_ADDRESS="$1"
DOMAIN="github.com"
MATCH_LINE_NUMBER=$(grep -n "^[^#]*${DOMAIN}" /etc/hosts | cut -f1 -d:)
HOST_RECORD="${IP_ADDRESS} ${DOMAIN}"

if [ -z "${IP_ADDRESS}" ]; then
  echo "错误：请指定目标 IP 地址。具体信息可前往 https://ipaddress.com/website/github.com"
  exit 1
fi

if [ -n "$MATCH_LINE_NUMBER" ]; then
  echo "Github DNS 解析记录已存在，正在更新..."
  while read -r line_number; do
    echo "$line_number"
    sudo sed -i '' "${line_number}s/.*/${HOST_RECORD}/" /etc/hosts
  done <<<"$MATCH_LINE_NUMBER"
else
  echo "${HOST_RECORD}" | sudo tee -a /etc/hosts >/dev/null
fi
echo "操作成功。${IP_ADDRESS} -> ${DOMAIN}"
