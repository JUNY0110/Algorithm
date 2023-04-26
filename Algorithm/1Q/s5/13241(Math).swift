//
//  13241.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/20.
//

import Foundation

class BaekJoon13241 {
    func run() { solution2() }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        print(nums[0] * nums[1] / gcd(nums[0], nums[1]))
        
        func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }
    }
    
    func solution2() {
        var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let multi = nums[0] * nums[1]
        while nums[1] != 0 {
            let temp = nums[0]
            nums[0] = nums[1]
            nums[1] = temp % nums[1]
        }
        print(multi / nums[0])
    }
}
