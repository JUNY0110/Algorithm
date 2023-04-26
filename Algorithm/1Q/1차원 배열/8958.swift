//
//  8958.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

class BaekJoon8958 {
    func run() {
        solution()
    }
    
    func solution() {
        if let input = readLine(),
           let testCase = Int(input) {
            
            for _ in 0..<testCase {
                var value = 0, result = 0
                guard let quizScore = readLine() else { break }
                
                quizScore.forEach {
                    if $0 == "O" {
                        value += 1
                        result += value
                    } else {
                        value = 0
                    }
                }
                print(result)
            }
        }
    }
}
