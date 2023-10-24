//
//  10163.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon2669 {
    func run() {
        solution()
    }
    
    private func solution() {
        var board = Array(repeating: Array(repeating: false, count: 101), count: 101)
        var result = 0
        
        for _ in 0..<4 {
            let size = readLine()!.split(separator: " ").compactMap { Int($0) }
            let startX = size[0], startY = size[1]
            let endX = size[2], endY = size[3]
            
            for row in startY..<endY {
                for col in startX..<endX where !board[row][col] {
                    board[row][col] = true
                    result += 1
                }
            }
        }

        print(result)
    }
}
