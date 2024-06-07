//
//  2579.swift
//  Algorithm
//
//  Created by 지준용 on 6/7/24.
//

import Foundation


final class BaekJoon2579 {
    func run() {
        solution()
    }
    
    private func solution() {
        let stairs = Int(readLine()!)!
        var dp = Array(repeating: 0, count: stairs+1)
        var points = Array(repeating: 0, count: stairs+1)
        
        for i in 1...stairs {
            points[i] = Int(readLine()!)!
        }
        
        dp[1] = points[1] // 첫번째 계단에서의 점수 합은 항상 동일.
        
        if stairs == 1 {
            print(points[1])
        }
        else if stairs == 2 {
            print(points[1]+points[2]) // 2번째 계단은 1번, 2번 둘 다 밟고 오는게 가장 큰 값.
        }
        else if stairs == 3 {
            print(max(points[1],points[2]) + points[3])  // 3번째 계단은 1번째 또는 2번째 계단을 밟고 와야 함.
        } else {
            dp[2] = points[1] + points[2]
            dp[3] = max(points[1],points[2]) + points[3]
            
            
            for i in 4...stairs {
                dp[i] = max(dp[i-2] + points[i], dp[i-3] + points[i-1] + points[i])
            }
            print(dp[stairs])
        }
    }
}
