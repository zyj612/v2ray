#!/usr/bin/env bats

load '../lib/pre-check.sh'

@test "预检查函数验证" {
  run pre_check -v 2.0 -f test.sh
  [ "$status" -eq 0 ]
}
