#!/usr/bin/env bats

@test "测试bats语法内容" {
  run echo xxx
  echo yyy >&2
  echo "Output: $output"
}