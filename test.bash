#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 kotaro sato <obake831@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

result=$(echo "1+2" | ./sisokuenzan.py)
if [ "$result" != "3" ]; then
  echo "Error: 1+2 expected 3 but got $result" >&2
  exit 1
fi

result=$(echo "10-4" | ./sisokuenzan.py)
if [ "$result" != "6" ]; then
  echo "Error: 10-4 expected 6 but got $result" >&2
  exit 1
fi

result=$(echo "6*7" | ./sisokuenzan.py)
if [ "$result" != "42" ]; then
  echo "Error: 6*7 expected 42 but got $result" >&2
  exit 1
fi

result=$(echo "8/2" | ./sisokuenzan.py)
if [ "$result" != "4.0" ]; then
  echo "Error: 8/2 expected 4.0 but got $result" >&2
  exit 1
fi


