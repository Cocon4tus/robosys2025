#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 kotaro sato <obake831@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

# 実行権限の確認（念のため）
chmod +x sisokuenzan

# テスト成否を判定する関数
# 引数: $1=テスト名, $2=期待する出力, $3=期待する終了ステータス
execute_test() {
    local test_name=$1
    local input=$2
    local expected_out=$3
    local expected_status=$4

    echo "Running test: $test_name"
    
    # 入力を渡して実行。標準出力と標準エラー出力をキャプチャ
    actual_out=$(echo -n "$input" | ./sisokuenzan 2>/dev/null)
    actual_status=$?

    # 1. 終了ステータスのチェック
    if [ "$actual_status" -ne "$expected_status" ]; then
        echo "  [FAIL] Status mismatch: Expected $expected_status, but got $actual_status" >&2
        exit 1
    fi

    # 2. 出力のチェック（正常系のみ）
    if [ "$expected_status" -eq 0 ] && [ "$actual_out" != "$expected_out" ]; then
        echo "  [FAIL] Output mismatch: Expected '$expected_out', but got '$actual_out'" >&2
        exit 1
    fi

    echo "  [PASS]"
}

# --- テストケース実行 ---

# 正常系: 足し算
execute_test "Addition" "1+2" "3" 0

# 正常系: 掛け算
execute_test "Multiplication" "6*7" "42" 0

# 異常系: 不正な文字（ステータス1を期待）
execute_test "Invalid Character" "1+a" "" 1

# 異常系: 空の入力（ステータス1を期待）
execute_test "Empty Input" "" "" 1

echo "All tests passed successfully!"
exit 0
