//
//  2438.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/24.
//

import Foundation

let starAmount = Int(readLine()!)!
var star = ""

// MARK: - 풀이 1
for _ in 0..<starAmount {
    star += "*"
    print(star)
}

// MARK: - 풀이 2
for _ in 0..<starAmount {
    star.insert("*", at: star.endIndex)
    print(star)
}
