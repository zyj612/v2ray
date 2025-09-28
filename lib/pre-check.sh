# 加载全局变量名
. ../config/variables.sh

# 加载公共方法
. ../lib/utils.sh

# 加载预检查
pre_check() {
    # check old version
    base_check
    # check parameters
    param_check $@
}

base_check(){

    [[ -f $is_sh_bin && -d $is_core_dir/bin && -d $is_sh_dir && -d $is_conf_dir ]] && {
        err "检测到脚本已安装, 如需重装请使用${green} ${is_core} reinstall ${none}命令."
    }

    # root
    [[ $EUID != 0 ]] && err "当前非 ${yellow}ROOT用户.${none}"

    # yum or apt-get, ubuntu/debian/centos
    cmd=$(type -P apt-get || type -P yum)
    [[ ! $cmd ]] && err "此脚本仅支持 ${yellow}(Ubuntu or Debian or CentOS)${none}."

    # systemd
    [[ ! $(type -P systemctl) ]] && {
    err "此系统缺少 ${yellow}(systemctl)${none}, 请尝试执行:${yellow} ${cmd} update -y;${cmd} install systemd -y ${none}来修复此错误."
    }
}


# parameters check
param_check() {
    local core_version=""
    local core_file=""
    while [[ $# -gt 0 ]]; do
        case $1 in
        online)
            err "如果想要安装旧版本, 请转到: https://github.com/233boy/v2ray/tree/old"
            ;;
        -f | --core-file)
            [[ -z $2 ]] && {
                err "($1) 缺少必需参数, 正确使用示例: [$1 /root/$is_core-linux-64.zip]"
            } || [[ ! -f $2 ]] && {
                err "($2) 不是一个常规的文件."
            }
            core_file=$2
            shift 2
            ;;
        -l | --local-install)
            [[ ! -f ${PWD}/src/core.sh || ! -f ${PWD}/$is_core.sh ]] && {
                err "当前目录 (${PWD}) 非完整的脚本目录."
            }
            local_install=1
            shift 1
            ;;
        -p | --proxy)
            [[ -z $2 ]] && {
                err "($1) 缺少必需参数, 正确使用示例: [$1 http://127.0.0.1:2333 or -p socks5://127.0.0.1:2333]"
            }
            proxy=$2
            shift 2
            ;;
        -v | --core-version)
            [[ -z $2 ]] && {
                err "($1) 缺少必需参数, 正确使用示例: [$1 v1.8.1]"
            }
            core_version=v${2#v}
            shift 2
            ;;
        -h | --help)
            show_help
            ;;
        *)
            echo -e "\n${is_err} ($@) 为未知参数...\n"
            show_help
            ;;
        esac
    done

# 本地文件和指定版本只能2选1，不能既选择指定本地文件还要指定对应的v2ray版本
    [[ $core_version && $core_file ]] && {
        err "无法同时自定义 ${is_core_name} 版本和 ${is_core_name} 文件."
    }
}