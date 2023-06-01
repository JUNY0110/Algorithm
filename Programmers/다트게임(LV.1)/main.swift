//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/01.
//

import Foundation


let main = Main()

main.run()

class Main {
    func run() {
        let dartResult = readLine()!
        print(solution(dartResult))
    }
    
    // 1S2D*3T -> 37
    // 1D2S#10S -> 9
    // 1D2S0T -> 3
    // 1S*2T*3S -> 23
    // 1D#2S*3S -> 5
    // 1T2D3D# -> -4
    // 1D2S3T* -> 59
    
    func solution(_ dartResult:String) -> Int {
        var stack = ""
        var scores = [Int]()
        
        for dart in dartResult {
            let dart = String(dart)
            stack += dart
            
            if dart == "S" || dart == "D" || dart == "T" {
                stack.removeLast()
                scores.append(calculate(&stack, bonus: dart))
            }
            
            if dart == "#" {
                stack.removeLast()
                scores[scores.endIndex-1] = achaAward(scores)
            }
            
            if dart == "*" {
                stack.removeLast()
                scores = starAward(&scores)
            }
        }
        return scores.reduce(0, +)
    }

    func calculate(_ stack: inout String, bonus: String) -> Int {
        guard var score = Int(stack) else { return -1 }
        
        switch bonus {
        case "D": score = Int(pow(Double(score), Double(2)))
        case "T": score = Int(pow(Double(score), Double(3)))
        default: break
        }
        stack = ""
        
        return score
    }


    func starAward(_ scores: inout [Int]) -> [Int] {
        if scores.count > 1 {
            for i in scores.endIndex-2..<scores.endIndex {
                scores[i] *= 2
            }
        } else {
            scores[0] *= 2
        }
        
        return scores
    }

    func achaAward(_ scores: [Int]) -> Int {
        guard var currentScore = scores.last else { return -1 }
        currentScore = currentScore * (-1)
        return currentScore
    }
}
