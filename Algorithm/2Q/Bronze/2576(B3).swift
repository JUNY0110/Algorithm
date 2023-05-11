//
//  2576.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon2576 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 홀수 합과 최소값 구하기
    
    func solution() {
        var oddNumbers = [Int]()
        
        for _ in 0..<7 {
            let num = Int(readLine()!)!
            
            if num % 2 == 1 {
                oddNumbers.append(num)
            }
        }

        if oddNumbers.isEmpty {
            print(-1)
        } else {
            print(oddNumbers.reduce(0, +), oddNumbers.min()!, separator: "\n")
        }
    }
}
