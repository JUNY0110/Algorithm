//
//  4153.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/11.
//

import Foundation

class BaekJoon4153 {
    func run() {
        solution3()
    }
    
    func solution1() {
        while true {
            var nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
            
            if nums[0] == 0 {
                break
            }
            
            for i in 0..<nums.count {
                nums[i] = nums[i] * nums[i]
            }
            print(nums[2] == nums[0] + nums[1] ? "right" : "wrong")
        }
    }
    
    func solution2() {
        while true {
            let nums = readLine()!.split(separator: " ").map { Int(pow(Double(Int(String($0))!),2)) }.sorted(by: <)
            
            if nums[0] == 0 {
                break
            }

            print(nums[2] == nums[0] + nums[1] ? "right" : "wrong")
        }
    }
    
    func solution3() {
        while true {
            let nums = readLine()!.split(separator: " ").map { Int(String($0))! * Int(String($0))! }.sorted(by: <)
            
            if nums[0] == 0 {
                break
            }

            print(nums[2] == nums[0] + nums[1] ? "right" : "wrong")
        }
    }
}
