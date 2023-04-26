//
//  1075.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon1085 {
    func run() { solution2() }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = nums[0], y = nums[1], w = nums[2], h = nums[3]
        let width = (w - x > x) ? x : (w - x)
        let height = (h - y > y) ? y : (h - y)
        
        print(width > height ? height : width)
    }
    
    func solution2() {
        let n = readLine()!.split(separator: " ").map{Int($0)!}
        let result = min(n[0], n[1], abs(n[0] - n[2]), abs(n[1] - n[3]))
        print(result)
    }
}
