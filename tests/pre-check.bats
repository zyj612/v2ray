#!/usr/bin/env bats

load '../lib/pre-check.sh'

@test "预检查函数一般验证" {
  run pre_check -v 2.0
  if [[ "$status" -eq 0 ]]; then
    # 成功时的断言
    echo "命令成功，状态码为 0"
  else
    # 失败时的断言
    echo "命令失败，状态码为 $status" >&2
    [[ "$output" == "检测到脚本已安装"* ]]  # 必须包含的关键字
  fi
}

@test "预检查函数同时传-v和-f参数" {
  run pre_check -v 2.0 -f test.sh
  [ "$status" -eq 1 ]
}



