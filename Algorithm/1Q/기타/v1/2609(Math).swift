//
//  2609.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/17.
//

import Foundation

class BaekJoon2609 {
    func run() { solution3() }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        var maxNum = 0
        
        for i in 0..<nums[0] {
            if nums[1].isMultiple(of: nums[0] - i) && nums[0].isMultiple(of: nums[0] - i) {
                maxNum = nums[0] - i
                break
            }
        }
        print(maxNum)
        print(nums[0] * nums[1] / maxNum)
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        let low = nums[0]
        let high = nums[1]
        
        func gcd(_ lowValue: Int, _ highValue: Int) -> Int {
            for i in 0..<lowValue {
                if highValue.isMultiple(of: lowValue - i) && lowValue.isMultiple(of: lowValue - i) { return lowValue - i }
            }
            return 0
        }
        
        print(gcd(low, high))
        print(low * high / gcd(low, high))
    }
    
    func solution3() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let gcdNum = gcd(nums[0], nums[1])
        let lcmNum = nums[0] * nums[1] / gcdNum
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 { return a }
            else {return gcd(b, a % b)}
        }

        print("\(gcdNum)\n\(lcmNum)")
        
        
//        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
//        let gcdValue = gcd(nums[0],nums[1])
//        let lcmValue = nums[0]*nums[1] / gcdValue
//
//        print(gcdValue)
//        print(lcmValue)
//
//        func gcd(_ a: Int, _ b: Int) -> Int {
//            if b == 0 { return a }
//            else {
//                print(b, a % b)
//                return gcd(b, a%b) }
//        }
    }
}
