//
//  2420.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon2420 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
        print(nums[1] - nums[0])
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        print(abs(nums[0] - nums[1]))
    }
}
