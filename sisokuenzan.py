#!/home/k0ta/anaconda3/bin/python3                        
# SPDX-FileCopyrightText: 2025 kotaro sato <obake831@gmail.com>
# SPDX-License-Identifier: BSD-3-Clause

import sys

num1 = int(input('a= :'))
num2 = int(input('b= :'))

choice = input('演算子は？')

if choice == '+':

    result = num1 + num2
    print(result)

elif choice == '-':

    result = num1 - num2
    print(result)

elif choice == '*':
    
    result = num1 * num2
    print(result)
elif choice == '/':
    
    result = num1 / num2
    print(result)

else:
    print("error")


