//
//  2475.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/11.
//

import Foundation

class BaekJoon2475 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var sum = 0
        
        nums.forEach {
            sum += $0 * $0
        }
        print(sum % 10)
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var sum = 0
        
        for num in nums {
            sum += num * num
        }
        print(sum % 10)
    }
}
