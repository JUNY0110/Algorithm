//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/26.
//

import Foundation

let input = Int(String(readLine()!))!
var result = 0
for i in 1...input {
    result += i
}

print(result)

print(Int(input * (input + 1) / 2))
