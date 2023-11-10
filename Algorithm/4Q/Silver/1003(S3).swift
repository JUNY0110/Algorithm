//
//  1003.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon1003 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            var dp = [(1, 0), (0, 1)]
            let n = Int(readLine()!)!
            
            for i in 0..<n {
                let (zero, one) = (dp[i].0 + dp[i+1].0, dp[i].1 + dp[i+1].1)
                dp.append((zero, one))
            }
            print(dp[n].0, dp[n].1)
        }
        
        
    }
}
