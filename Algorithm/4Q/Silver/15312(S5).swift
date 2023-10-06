//
//  15312.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/28.
//

import Foundation

class BaekJoon15312 {
    func run() {
        solution()
    }
    
    private func solution() {
        let myName = readLine()!.map { String($0) }
        let partner = readLine()!.map { String($0) }
        var scores = [Int]()
        
        let alphabet = ["A": 3, "B": 2, "C": 1, "D": 2, "E": 3, "F": 3,
                        "G": 2, "H": 3, "I": 3, "J": 2, "K": 2, "L": 1,
                        "M": 2, "N": 2, "O": 1, "P": 2, "Q": 2, "R": 2,
                        "S": 1, "T": 2, "U": 1, "V": 1, "W": 1, "X": 2,
                        "Y": 2, "Z": 1]
        
        for (my, other) in zip(myName, partner) {
            guard let myCount = alphabet[my],
                  let otherCount = alphabet[other] else { continue }
            scores.append(myCount)
            scores.append(otherCount)
        }

        while scores.count > 2 {
            var temp = [Int]()
            
            for i in 0..<scores.count-1 {
                temp.append(Int(scores[i] + scores[i + 1]) % 10)
            }
            
            scores = temp
        }

        print(scores.map { String($0) }.joined())
    }
    
    private func solution2() {
        let myName = readLine()!.map { String($0) }
        let partner = readLine()!.map { String($0) }
        var scores = [Int]()
        
        let alphabet = ["A": 3, "B": 2, "C": 1, "D": 2, "E": 3, "F": 3,
                        "G": 2, "H": 3, "I": 3, "J": 2, "K": 2, "L": 1,
                        "M": 2, "N": 2, "O": 1, "P": 2, "Q": 2, "R": 2,
                        "S": 1, "T": 2, "U": 1, "V": 1, "W": 1, "X": 2,
                        "Y": 2, "Z": 1]
        
        for (my, other) in zip(myName, partner) {
            guard let myCount = alphabet[my],
                  let otherCount = alphabet[other] else { continue }
            scores.append(myCount)
            scores.append(otherCount)
        }
        
        calculateScore()
        print(scores.map { String($0) }.joined())
        
        func calculateScore() {
            if scores.count == 2 { return }

            for i in 0..<scores.count-1 {
                scores[i] = Int(String(String(scores[i] + scores[i + 1]).last!))!
            }
            scores.removeLast()

            calculateScore()
        }
    }
}
