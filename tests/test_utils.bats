#!/usr/bin/env bats
@test "err outputs formatted message" {
  source ../lib/utils.sh
  run err "Test message"  2>&1
  echo "Output: $output"
  echo "Status: $status"
  [ "$status" -eq 0 ]
  [ "${lines[0}" = "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - Test message" ]
}