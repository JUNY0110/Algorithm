//
//  4344.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

class BaekJoon4344 {
    func run() {
        solution()
    }
    
    func solution() {
        if let input = readLine(),
           let studentNum = Int(input) {

            for _ in 0..<studentNum {
                var sum = 0
                var average: Double = 0
                var result: Double = 0
                guard let scores = readLine()?.split(separator: " ").map ({ Int($0)! }) else { break }

                for i in 1...scores[0] {
                    sum += scores[i]
                }

                average = Double(sum / scores[0])

                for j in 1...scores[0] {
                    if Double(scores[j]) > average {
                        result += 1
                    }
                }
                
                result = Double(result) / Double(scores[0]) * 100

                print("\(String(format: "%.3f", result))%")
            }
        }
    }
}
