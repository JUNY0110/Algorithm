//
//  11382.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/21.
//

import Foundation

class BaekJoon11382 {
    func run() { solution2() }
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        print(nums[0] + nums[1] + nums[2])
    }
    
    func solution2() {
        print(readLine()!.split(separator: " ").map { Int(String($0))! }.reduce(0, +))
        
    }
}
