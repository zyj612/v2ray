#!/usr/bin/env bats

load '../lib/utils.sh'

@test "err outputs formatted message" {
  run err "Test1 message"  2>&1
  echo "Output: $output"
  echo "Status: $status"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Test1 message" ]
}

@test "msg outputs formatted message" {
  run msg "Test2 message"
  [ "$status" -eq 0 ]
  echo ${lines[0]}
}