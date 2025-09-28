#!/bin/bash

. ../config/variables.sh
. ../lib/pre-check.sh

main(){
    show_welcome_msg
    pre_check $@


}


# show welcome msg
show_welcome_msg(){
    # github=https://github.com/zyj612/v2ray
    local author=zyj612
    clear
    echo
    echo "........... $is_core_name script by $author .........."
    echo
}

启动
main $@