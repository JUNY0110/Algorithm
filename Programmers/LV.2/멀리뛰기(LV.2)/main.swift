//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/05.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        print(solution(n))
    }
    
    func solution(_ n:Int) -> Int {
        var dp = Array(repeating: 1, count : n+1)
        
        if n < 2 { return dp[n] }
        
        for i in 2...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 1234567
        }
        
        return dp[n]
    }
}
