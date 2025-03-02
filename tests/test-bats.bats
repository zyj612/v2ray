#!/usr/bin/env bats

@test "测试bats语法内容" {
  run echo xxx
  echo yyy >&2
  echo "Output: $output" >&3
}

@test "测试bats标准错误是否输出进output" {
  run his xxx
  echo yyy >&2
  echo "Output: $output" >&3
}