//
//  1343.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon1343 {
    func run() {
        solution()
    }
    
    private func solution() {
        var board = readLine()!
        board = board.replacingOccurrences(of: "XXXX", with: "AAAA")
        board = board.replacingOccurrences(of: "XX", with: "BB")
        
        print(board.contains("X") ? -1 : board)
    }
}
