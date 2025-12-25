#!/usr/bin/env python3                        
# SPDX-FileCopyrightText: 2025 kotaro sato <obake831@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys

data = sys.stdin.read().strip()

if data == "":
    sys.exit(0)


allowed = "0123456789+-*/()."


for c in data:
    if c not in allowed:
        sys.exit(1)



try:
    result = eval(data)
except Exception:
    sys.exit(1)

print(result)
sys.exit(0)


