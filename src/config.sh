#!/bin/bash

# 欢迎信息
echo "欢迎使用多级菜单交互式脚本！"

# 顶级菜单函数
top_menu() {
    echo "顶级菜单："
    echo "1. 系统管理"
    echo "2. 网络工具"
    echo "3. 退出"
    read -p "请输入选项编号: " top_choice
    case $top_choice in
        1) system_management_menu ;;
        2) network_tools_menu ;;
        3) exit 0 ;;
        *) echo "无效选项，请重试。" ;;
    esac
}

# 系统管理菜单
system_management_menu() {
    echo "系统管理："
    echo "1. 显示系统信息"
    echo "2. 检查磁盘使用情况"
    echo "3. 返回上一级"
    read -p "请输入选项编号: " sys_choice
    case $sys_choice in
        1) show_system_info ;;
        2) check_disk_usage ;;
        3) top_menu ;;
        *) echo "无效选项，请重试。" ;;
    esac
}

# 网络工具菜单
network_tools_menu() {
    echo "网络工具："
    echo "1. 显示网络配置"
    echo "2. 安全检查"
    echo "3. 返回上一级"
    read -p "请输入选项编号: " net_choice
    case $net_choice in
        1) show_network_info ;;
        2) security_check ;;
        3) top_menu ;;
        *) echo "无效选项，请重试。" ;;
    esac
}

# 显示系统信息
show_system_info() {
    echo "系统信息："
    uname -a
    lsb_release -a
    # 返回上一级
    echo "按任意键返回上一级菜单..."
    read
    system_management_menu
}

# 检查磁盘使用情况
check_disk_usage() {
    echo "磁盘使用情况："
    df -h
    # 返回上一级
    echo "按任意键返回上一级菜单..."
    read
    system_management_menu
}

# 显示网络配置
show_network_info() {
    echo "网络配置："
    ifconfig
    # 返回上一级
    echo "按任意键返回上一级菜单..."
    read
    network_tools_menu
}

# 安全检查
security_check() {
    echo "检查常见安全问题："
    echo "1. 检查SSH端口"
    read -p "请输入SSH端口号（默认22）: " ssh_port
    if [ -z "$ssh_port" ]; then ssh_port=22; fi
    netstat -an | grep ":$ssh_port"
    echo "2. 检查防火墙状态"
    sudo ufw status
    # 返回上一级
    echo "按任意键返回上一级菜单..."
    read
    network_tools_menu
}

# 主程序循环
while true; do
    top_menu
done