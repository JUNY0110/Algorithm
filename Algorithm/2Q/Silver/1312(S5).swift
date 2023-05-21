//
//  1312.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/21.
//

import Foundation

class BaekJoon1312 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 소수
    /// - IMPORTANT: 소수점 이하의 수는 값을 나눈 나머지값의 모음과 같다.
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        var a = nums[0]
        let b = nums[1], n = nums[2]
        var result = 0
        
        for _ in 0..<n {
            a = (a % b) * 10
            result = a / b
        }
        print(result)
    }
}
