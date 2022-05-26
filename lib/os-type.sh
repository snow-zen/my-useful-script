#!/bin/bash

# @description 返回当前系统的类型
# @author snow-zen

os_type() {
  OS_TYPE=""
  case "$(uname -s)" in
  Linux*) OS_TYPE="Linux" ;;
  Darwin*) OS_TYPE="Mac" ;;
  MINGW*) OS_TYPE="MinGw" ;;
  *) OS_TYPE="UNKNOWN" ;;
  esac
  echo $OS_TYPE
}

os_type
