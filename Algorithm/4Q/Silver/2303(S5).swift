//
//  2303.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/09.
//

import Foundation


final class BaekJoon2303 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var max = Int.min
        var result = [Int]()
        
        for _ in 0..<n {
            let cards = readLine()!.split(separator: " ").compactMap { Int($0) }
            dfs(0, 0, cards, 0)
            
            result.append(max)
            max = Int.min
        }
        
        if let winner = result.max(), let index = result.lastIndex(of: winner) {
            print(index+1)
        }
        
        func dfs(_ start: Int, _ count: Int, _ cards: [Int], _ sum: Int) {
            if count == 3 {
                let remainder = sum % 10
                
                if max < remainder {
                    max = remainder
                }
                return
            }
            
            for i in start..<cards.count {
                dfs(i+1, count+1, cards, sum + cards[i])
            }
        }
    }
}
