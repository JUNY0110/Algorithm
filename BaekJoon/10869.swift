//
//  10869.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/22.
//

import Foundation

let cal = readLine()!.split(separator: " ").map{Int($0)!}
let (A,B) = (cal[0], cal[1])

print(A + B)
print(A - B)
print(A * B)
print(A / B)
print(A % B)

print(cal[0] + cal[1])
print(cal[0] - cal[1])
print(cal[0] * cal[1])
print(cal[0] / cal[1])
print(cal[0] % cal[1])


