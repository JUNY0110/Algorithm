//
//  9095.swift
//  Algorithm
//
//  Created by 지준용 on 6/7/24.
//

import Foundation


final class BaekJoon9095 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        
        
        for _ in 0..<t {
            let n = Int(readLine()!)! // 만들어야 하는 수. 4 ,7 , 10
            var dp = Array(repeating: 0, count: n+1)
            dp[0] = 0
            guard n >= 1 else {
                print(dp[n])
                continue
            }
            dp[1] = 1
            guard n >= 2 else {
                print(dp[n])
                continue
            }
            dp[2] = 2
            guard n >= 3 else {
                print(dp[n])
                continue
            }
            dp[3] = 4
            
            if n > 3 {
                for j in 4...n {
                    dp[j] = dp[j-1] + dp[j-2] + dp[j-3]
                }
            }
            
            print(dp[n])
        }
    }
}
