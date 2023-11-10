//
//  15624.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon15624 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        func fibonacci(_ n: Int) -> Int {
            if n < 2 {
                return n
            }
            
            var a: Int = 0
            var b: Int = 1
            
            for _ in 0..<(n-1) {
                let temp = b
                b = (a+b) % 1000000
                a = temp
            }
            return b
        }
        print(fibonacci(num))
    }
    
    private func solution2() {
        if let input = readLine(),
           let n = Int(input) {
            var dp = Array(repeating: 0, count: 1000001)
            dp[1] = 1
            
            if n >= 2 {
                for i in 2...n {
                    dp[i] = (dp[i-1] + dp[i-2]) % 1000000007
                }
            }
            print(dp[n])
        }
    }
}
