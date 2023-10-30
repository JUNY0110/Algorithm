//
//  17224.swift
//  Algorithm
//
//  Created by 지준용 on 10/30/23.
//

import Foundation


final class BaekJoon17224 {
    func run() {
        solution()
    }
    
    private func solution() {
        struct Question {
            let easy: Int
            let hard: Int
        }
        
        let nlk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nlk[0]
        let l = nlk[1]
        var k = nlk[2]
        var questions = [Question]()
        var estimatedScore = 0
        
        if k > 0 {
            for _ in 0..<n {
                let question = readLine()!.split(separator: " ").compactMap { Int($0) }
                let easy = question[0], hard = question[1]
                questions.append(Question(easy: easy, hard: hard))
            }
            
            questions.sort(by: {
                $0.hard < $1.hard
            })
            
            for question in questions {
                if question.easy <= l {
                    estimatedScore += 100
                    
                    k -= 1
                    
                    if question.hard <= l {
                        estimatedScore += 40
                    }
                }
                
                if k == 0 { break }
            }
        }
        print(estimatedScore)
    }
}
