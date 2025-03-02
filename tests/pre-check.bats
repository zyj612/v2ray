#!/usr/bin/env bats

load '../lib/pre-check.sh'

@test "预检查信息" {
  run precheck -v 2.0 -f test.sh
  [ "$status" -eq 0 ]
}
