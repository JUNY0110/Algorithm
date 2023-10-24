//
//  1138.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon1138 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nm[0], m = nm[1]
        var board = Array(repeating: Array(repeating: "", count: m), count: n)
        
        for i in 0..<n {
            let numbers = readLine()!.map { String($0) }
            board[i] = numbers
        }
        
        var side = min(n, m)
        var result = 0
        
        outLoop: while side > 0 {
            for i in 0..<n-side {
                for j in 0..<m-side {
                    if board[i][j] == board[i+side][j]
                        && board[i][j] == board[i][j + side]
                        && board[i][j] == board[i+side][j+side] {
                        
                        let size = (side + 1) * (side + 1)
                        
                        if result < size {
                            result = size
                            break outLoop
                        }
                    }
                }
            }
            side -= 1
        }
        print(result == 0 ? 1 : result)
    }
}
