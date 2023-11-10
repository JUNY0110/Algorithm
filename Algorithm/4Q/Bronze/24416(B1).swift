//
//  24416.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon24416 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var dp = Array(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 1
        
        var recursionCount = 0
        var dpCount = 0
        
        recursionCount = fibonacci(n)
        
        print(recursionCount, dpCount)
        
        func fibonacci(_ num: Int) -> Int {
            if num == 1 || num == 2 {
                return 1
            }
            
            for i in 3...num {
                dp[i] = dp[i-1] + dp[i-2]
                dpCount += 1
            }
            
            return dp[num]
        }
    }
    
    private func solution2() {
        let n = Int(readLine()!)!
        var dp = [0, 1]
        
        for i in 2...n {
            dp.append((dp[i-2] % 1000000007) + (dp[i-1] % 1000000007))
        }
        print(dp[n], (n-2) % 1000000007)
    }
}
