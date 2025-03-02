#!/usr/bin/env bats

load '../lib/pre-check.sh'

@test "预检查函数一般验证" {
  run pre_check -v 2.0 -f test.sh
  [ "$status" -eq 0 ]
}

@test "预检查函数同时传-v和-f参数" {
  run pre_check -v 2.0 -f test.sh
  [ "$status" -eq 1 ]
}



