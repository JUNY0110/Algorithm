//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/27.
//

import Foundation
let main = Main()
main.run()

class Main {
    func run() {
        let board = readLine()!.split(separator: " ").map { String($0).compactMap { Int(String($0))} }
        let moves = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution1(board, moves))
    }
    
    func solution1(_ board:[[Int]], _ moves:[Int]) -> Int {
        var board = board
        var basket = [Int]()
        var result = 0
        
        for move in moves {
            var y = 0
            
            while y < board.count {
                let doll = board[y][move-1]
                
                if doll == 0 {  // 인형이 없으면 크레인은 계속 내려감
                    y += 1
                    continue
                }
                basket.append(doll)
                board[y][move-1] = 0  // 인형이 있던 자리를 0으로 비워줌
                
                if board[y][move-1] == 0 { break }
            }
            
            if (basket.count >= 2) && (basket[basket.endIndex-1] == basket[basket.endIndex-2]) {
                basket.removeLast(2)
                result += 2
            }
        }
        
        return result
    }
    
    func solution2(_ board:[[Int]], _ moves:[Int]) -> Int {
        var count = 0
        var stack: [[Int]] = Array(repeating: [], count: board.count)
        var basket: [Int] = []

        for dolls in board.reversed() {
            for (i, doll) in dolls.enumerated() {
                if doll != 0 {
                    stack[i].append(doll)
                }
            }
        }
        
        for move in moves {
            if let doll = stack[move-1].popLast() {
                if let last = basket.last, last == doll {
                    basket.removeLast()
                    count += 2
                    continue
                }
                basket.append(doll)
            }
        }
        
        return count
    }
}
