//
//  14582.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon14582 {
    func run() {
        solution()
    }
    
    private func solution() {
        let ourTeam = readLine()!.split(separator: " ").compactMap { Int($0) }
        let otherTeam = readLine()!.split(separator: " ").compactMap { Int($0) }
        var isWinning = false, isDefeated = false
        var (inning, ourScore, otherScore) = (0, 0, 0)
        
        // 상대팀이 이기는 중에, 우리팀이 졌다면, Yes. 그렇지 않으면 No
        for (our, other) in zip(ourTeam, otherTeam) {
            inning += 1
            ourScore += our

            if ourScore > otherScore {
                isWinning = true
            }
            
            otherScore += other
            
            if inning == 9 && isWinning && otherScore > ourScore {
                isDefeated = true
            }
        }
        print(isDefeated ? "Yes" : "No")
    }
}
