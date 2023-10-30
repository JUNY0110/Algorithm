//
//  28417.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon28417 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numberOrPeople = Int(readLine()!)!
        var winner = 0
        
        for _ in 0..<numberOrPeople {
            let scores = readLine()!.split(separator: " ").compactMap { Int($0) }
            let runs = scores[0...1]
            guard let highScoreRun = runs.max() else { continue }
            
            let tricks = scores[2...]
            let sortedTricks = tricks.sorted(by: >)
            let highScoreTricks = sortedTricks[0...1].reduce(0, +)
            
            let score = highScoreRun + highScoreTricks
            
            if winner < score {
                winner = score
            }
        }
        print(winner)
    }
}
