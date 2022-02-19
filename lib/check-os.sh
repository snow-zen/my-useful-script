#!/bin/bash

# 通过 uname -v 打印系统信息判断其中是否包含指定字符标识。存在返回 0，否则返回 1。

if [[ "$(uname -v)" == *"$1"* ]]
then 
    exit 0
else
    exit 1
fi