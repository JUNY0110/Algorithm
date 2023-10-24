//
//  1233.swift
//  Algorithm
//
//  Created by 지준용 on 10/23/23.
//

import Foundation


final class BaekJoon1233 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let dices = readLine()!.split(separator: " ").compactMap { Int($0) }
        let dice1 = Array(1...dices[0])
        let dice2 = Array(1...dices[1])
        let dice3 = Array(1...dices[2])
        
        var cases = [Int: Int]()
        
        for i in dice1 {
            for j in dice2 {
                for k in dice3 {
                    cases[i + j + k, default: 0] += 1
                }
            }
        }
        
        let result = cases.sorted(by: {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        })
        print(result[0].key)
    }
    
    private func solution2() {
        let dices = readLine()!.split(separator: " ").compactMap { Int($0) }
        let dice1 = Array(1...dices[0])
        let dice2 = Array(1...dices[1])
        let dice3 = Array(1...dices[2])
        
        var cases = Array(repeating: 0, count: 81)
        
        for i in dice1 {
            for j in dice2 {
                for k in dice3 {
                    cases[i + j + k] += 1
                }
            }
        }

        print(cases.firstIndex(of: cases.max()!)!)
    }
}
