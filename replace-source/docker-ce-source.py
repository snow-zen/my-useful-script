#!/usr/bin/env python3

# 替换 Docker-CE 镜像库地址
import json
import pathlib

DAEMON_CONFIG_PATH = '/etc/docker/daemon.json'


def ensure_exist_dir():
    """保证配置所在目录存在"""
    pathlib.Path('/etc/docker').mkdir(parents=True, exist_ok=True)


def read_daemon_config():
    """读取配置文件"""
    try:
        with open(DAEMON_CONFIG_PATH, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        return {}


def config_registry_mirrors(config):
    """配置镜像信息"""
    config['registry-mirrors'] = ['https://83tnzmjf.mirror.aliyuncs.com']


def write_daemon_config(config):
    """写入配置文件"""
    with open(DAEMON_CONFIG_PATH, 'w+') as f:
        f.write(json.dumps(config, indent=2))


ensure_exist_dir()
daemon_config = read_daemon_config()
config_registry_mirrors(daemon_config)
write_daemon_config(daemon_config)
