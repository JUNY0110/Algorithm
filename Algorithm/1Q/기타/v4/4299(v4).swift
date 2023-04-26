//
//  4299.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon4299 {
    func run() {
        solution()
    }
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = (nums[0] + nums[1]) / 2
        let b = (nums[0] - nums[1]) / 2
        
        if (nums[0] + nums[1]) % 2 != 1 && a + b >= a - b {
            print(a, b)
        } else {
            print(-1)
        }
    }
}
