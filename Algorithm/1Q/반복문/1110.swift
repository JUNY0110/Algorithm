//
//  1110.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/24.
//

import Foundation

// MARK: - 풀이 1 (기본 메서드 활용)
if let input = readLine() {
    var result = String(input)
    var value = 0
    var cycle = 0

    repeat {
        if result.count < 2 && result != "0" {
            result = "0" + result
        }

        value = Int(result.prefix(1))! + Int(result.suffix(1))!
        result = "\(result.suffix(1))\(String(value).suffix(1))"
        cycle += 1

    } while Int(input) != Int(result)
    print(cycle)
}


// MARK: - 풀이 2 (산술연산 활용)
if let input = Int(readLine()!) {
    var newInput = input
    var cycle = 0

    repeat {
        newInput = (newInput % 10) * 10 + (newInput/10 + newInput % 10) % 10
        cycle += 1
    } while newInput != input
    print(cycle)
}
