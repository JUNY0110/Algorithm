//
//  17175.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon17175 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var dp = [1, 1, 3]

        for i in 0..<n {
            dp.append(dp[i+2] + dp[i+2] - dp[i])
        }
        
        print(dp[n] % 1000000007)
    }
}
