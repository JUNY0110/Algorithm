//
//  2439.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/24.
//

import Foundation

let starAmount = Int(readLine()!)!
var star = ""
var spacer = ""
var result = ""

// MARK: - 풀이 1
for _ in 0..<starAmount {
    spacer.insert(" ", at: spacer.startIndex)
}

for _ in 0..<starAmount {
    spacer.remove(at: spacer.startIndex)
    star.insert("*", at: star.startIndex)

    result = spacer + star
    print(result)
}

// MARK: - 풀이 2
for cnt in 1...starAmount {
    print(String(repeating: " ", count: starAmount - cnt), terminator: "")
    print(String(repeating: "*", count: cnt))
}

// MARK: - 풀이 3
for cnt in 1...starAmount {
    spacer = String(repeating: " ", count: starAmount - cnt)
    star = String(repeating: "*", count: cnt)
    result = spacer + star
    print(result)
}
