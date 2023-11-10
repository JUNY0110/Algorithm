//
//  14495.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon14495 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var dp = Array(repeating: 1, count: n)
        
        if n >= 3 {
            for i in 3..<n {
                dp[i] = dp[i-1] + dp[i-3]
            }
        }
        print(dp[n-1])
    }
}
