//
//  2562.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

// MARK: - 풀이 1 (Force unwrapping X)
var valueArray: [Int] = []

for _ in 0..<9 {
    if let input = readLine(),
       let value = Int(input) {
        valueArray.append(value)
    }
}

if let maxValue = valueArray.max(),
   let maxValueIndex = valueArray.firstIndex(of: maxValue) {
    print(maxValue)
    print(maxValueIndex + 1)
}

// MARK: - 풀이 2 (배열 사용 X)
var maxValue = 0
var maxValueIndex = 0

for i in 0..<9 {
    let input = Int(readLine()!)!
    if maxValue < input {
        maxValue = input
        maxValueIndex = i + 1
    }
}
print(maxValue)
print(maxValueIndex)
