//
//  1546.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

class BaekJoon1546 {
    func run() {
        solution4()
    }
    
    func solution1() {
        if let input = readLine(),
           let subject = Double(input),
           let scores = readLine()?.split(separator: " ").map ({ Double($0)! }) {
            var trickScore: Double = 0
                        
            for i in 0..<Int(subject) {
                trickScore += (scores[i] / scores.max()!) * 100
            }
            
            let average = trickScore / subject
            print(average)
        }
    }
    
    func solution2() {
        if let input = readLine(),
           let subject = Double(input),
           let scores = readLine()?.split(separator: " ").map ({ Double($0)! }) {
            
            print((scores.map { $0 / scores.max()! * 100}.reduce(0, +)) / subject)
        }
    }
    
    func solution3() {
        if let input = readLine(),
           let subject = Double(input),
           let scores = readLine()?.split(separator: " ").map ({ Double($0)! }),
           let maxScore = scores.max() {
            let trickScores = scores.map { $0/maxScore * 100 }
            let trickScoreAVG = trickScores.reduce(0, +) / subject
            
            print(trickScoreAVG)

        }
    }
    
    func solution4() {
        if let input = readLine(),
           let subject = Double(input),
           let scores = readLine()?.split(separator: " ").map ({ Double($0)! }),
           let maxScore = scores.max() {
            let trickScores = scores.map { $0/maxScore * 100 }
            var sum: Double = 0.0
            
            for i in trickScores {
                sum += i
            }
            print(sum / subject)
        }
    }
}
