#!/bin/bash

# @description 检查命令是否存在
# @author snow-zen
# @example check-command curl

check_command() {
  CMD=$1
  if [ -x "$(command -v "$CMD")" ]; then
    exit 0
  else
    exit 1
  fi
}

check_command "$@"
