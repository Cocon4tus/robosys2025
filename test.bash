#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 kotaro sato <obake831@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause



check_result() {
    local test_name=$1
    local expected=$2
    local actual=$3
    local status=$4

    if [ "$status" -ne 0 ]; then
        echo "FAIL: $test_name (exit status: $status, expected success)" >&2
        exit 1
    fi
    if [ "$actual" != "$expected" ]; then
        echo "FAIL: $test_name (output: $actual, expected: $expected)" >&2
        exit 1
    fi
}


out=$(echo "1+2" | ./sisokuenzan)
check_result "Addition" "3" "$out" $?


out=$(echo "6*7" | ./sisokuenzan)
check_result "Multiplication" "42" "$out" $?


echo "1+a" | ./sisokuenzan > /dev/null 2>&1
st=$?
if [ "$st" -eq 0 ]; then
    echo "FAIL: 1+a (should have failed but got exit status 0)" >&2
    exit 1
fi


echo "" | ./sisokuenzan > /dev/null 2>&1
st=$?
if [ "$st" -eq 0 ]; then
    echo "FAIL: empty input (should have failed but got exit status 0)" >&2
    exit 1
fi


echo "All tests passed!"
exit 0


