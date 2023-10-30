//
//  27522.swift
//  Algorithm
//
//  Created by 지준용 on 10/27/23.
//

import Foundation


final class BaekJoon27522 {
    func run() {
        solution()
    }
    
    private func solution() {
        // 순위점수의 합계가 높은 팀이 승리
        // 합계가 같으면 최고 순위가 가장 높은 팀이 승리
        
        struct Record {
            let ms: Int
            let teamColor: String
        }
        
        var records = [Record]()
        var red = 0
        var blue = 0
        let scores = [10, 8, 6, 5, 4, 3, 2, 1, 0]
        
        for _ in 0..<8 {
            let record = readLine()!.split(separator: " ").map { String($0) }
            let time = record[0].split(separator: ":").compactMap { Int($0) }
            let ms = time[0] * 60 * 1000 + time[1] * 1000 + time[2]
            let teamColor = record[1]
            
            records.append(Record(ms: ms, teamColor: teamColor))
        }
        
        records.sort(by: {$0.ms < $1.ms})
        
        for i in 0..<8 {
            if records[i].teamColor == "R" {
                red += scores[i]
                continue
            }
            blue += scores[i]
        }
        
        if red == blue {
            print(records[0].teamColor == "R" ? "Red" : "Blue")
        } else {
            print(red > blue ? "Red" : "Blue")
        }
    }
}
