//
//  5533.swift
//  Algorithm
//
//  Created by 지준용 on 10/16/23.
//

import Foundation


final class BaekJoon5533 {
    func run() {
        solution()
    }
    
    private struct Player {
        let cards: [Int]
        var score: Int
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var players = [Player]()
        
        for _ in 1...n {
            let cards = readLine()!.split(separator: " ").compactMap{ Int($0) }
            players.append(Player(cards: cards, score: 0))
        }
        
        for i in 0..<3 { // 게임 횟수
        outLoop: for j in 0..<n { // 비교군
            for k in 0..<n where j != k {
                // i회차 게임에 대한 score 비교
                if players[j].cards[i] == players[k].cards[i] {
                    continue outLoop
                }
            }
            players[j].score += players[j].cards[i]
        }
        }
        
        players.forEach {
            print($0.score)
        }
    }
}
