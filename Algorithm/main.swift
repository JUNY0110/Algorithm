//
//  main.swift
//  Algorithm
//
//  Created by 지준용 on 2022/06/21.
//

import Foundation

// 두 자연수 A와 B가 주어진다. 이때, A+B, A-B, A*B, A/B(몫), A%B(나머지)를 출력하는 프로그램을 작성하시오.

// 덧셈
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

