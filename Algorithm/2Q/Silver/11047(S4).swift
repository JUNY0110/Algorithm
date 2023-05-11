//
//  11047.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon11047 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 필요한 동전 최소갯수 구하기
    /// - IMPORTANT: 가장 큰 단위 돈부터 값이 나누어지는지 확인.
    
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let n = input[0]
        var sum = input[1]
        
        var coins = [Int]()
        var result = 0
        
        for _ in 0..<n {
            coins.append(Int(readLine()!)!)
        }
        
        coins.sort(by: >)
        
        coins.forEach {
            if (sum / $0) > 0 {
                result += (sum / $0)
                sum %= $0
            }
        }
        print(result)
    }
}
