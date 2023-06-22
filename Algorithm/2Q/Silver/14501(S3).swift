//
//  14501.swift
//  Algorithm
//
//  Created by 지준용 on 2023/06/22.
//

import Foundation

class BaekJoon14501 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var t = Array(repeating: 0, count: n+1) // 소요 시간
        var p = Array(repeating: 0, count: n+1) // 예상 수익
        var dp = Array(repeating: 0, count: n+2)
        
        for i in 1...n {
            let tp = readLine()!.split(separator: " ").compactMap { Int($0) }
            t[i] = tp[0] // 상담별 소요 시간
            p[i] = tp[1] // 상담별 예상 수익
            
            dp[i] = tp[1] // 시간타임별 예상 수익 저장
        }

        for i in stride(from: n, to: 0, by: -1) {
            if t[i] + i <= n + 1 {
                dp[i] = max(dp[i+1], dp[i + t[i]] + p[i])
            } else {
                dp[i] = dp[i + 1]
            }
        }
        print(dp)
    }
}
