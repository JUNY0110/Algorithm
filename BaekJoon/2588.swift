//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/23.
//

import Foundation

let input1 = Int(readLine()!)!
let input2 = Int(readLine()!)!

print(input1 * (input2 % 10))
print(input1 * (input2 % 100 / 10))
print(input1 * (input2 / 100))

print(input1 * input2)
//
//
//print(input1 * (input2 % 10))
//print(input1 * (input2 % 100 - input2 % 10))
//print(input1 * (input2 - input2 % 100))
//
//print(input1 * input2)

print(253 % 10)
print(253 % 100 - 253 % 10)
print(253 - 253 % 100)
