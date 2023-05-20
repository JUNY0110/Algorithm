//
//  27433.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/20.
//

import Foundation

class BaekJoon27433 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 팩토리얼
    /// - IMPORTANT: 재귀 함수 구현
    
    func solution() {
        func factorial(num: Int) -> Int {
            if num <= 1 {
                return 1
            }
            return num * factorial(num: num - 1)
        }
        
        print(factorial(num: Int(readLine()!)!))
    }
}
