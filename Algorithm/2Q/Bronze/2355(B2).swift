//
//  2355.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon2355 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 시그마 공식
    /// - IMPORTANT: 가우스 공식. 두 수 사이의 모든 수의 합
    /// -- (두 수의 합) * (두수의 차 + 1) / 2
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        print((nums[0] + nums[1]) * (abs(nums[0] - nums[1]) + 1) / 2)
        print((nums[0] * nums[1]) / 2)
    }
}
