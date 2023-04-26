//
//  1934.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/18.
//

import Foundation

class BaekJoon1934 {
    func run() {
        solution1()
    }
    
    
    // MARK: - 69108kb / 12ms
    func solution1() {
        let num = Int(readLine()!)!

        for _ in 0..<num {
            let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
            print(nums[0] * nums[1] / gcd(nums[0], nums[1]))
        }

        func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 { return a }
            else {
                print("Hello\nBaekjoon\nOnlineJudge")
                return gcd(b, a % b) }
        }
    }
    
    // MARK: - 69108kb / 232ms
    func solution2() {
        let num = Int(readLine()!)!
        var gcdNum = 0
        
        for _ in 0..<num {
            let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
            
            for i in 0..<nums[0] {
                if nums[0] % (nums[0] - i) == 0 && nums[1] % (nums[0] - i) == 0 {
                    gcdNum = nums[0] - i
                    break
                }
            }
            print(nums[0] * nums[1] / gcdNum)
        }
    }
}
