//
//  3003.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/23.
//

import Foundation

let input = readLine()!
let currentChessAmount = input.split(separator: " ").map { Int($0)! }
let totalChessAmount: [Int] = [1, 1, 2, 2, 2, 8]
var needChessPiece = 0

for cnt in 0..<totalChessAmount.count {
    needChessPiece = totalChessAmount[cnt] - currentChessAmount[cnt]
    print(needChessPiece, terminator: " ")
}
