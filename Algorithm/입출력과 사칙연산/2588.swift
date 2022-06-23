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

// 위 식이 안 되는 이유는, 각각 한 자리의 수로 남아 곱셈이 되어야 하는데, 1, 10, 100 단위로 남아 곱했기 때문.
// 예를 들어 253 *  253이라면, 253*3, 253*5, 253*2 순으로 나와야 한다.

print(253 % 10)
print(253 % 100 - 253 % 10)
print(253 - 253 % 100)
