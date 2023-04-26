//
//  2587.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/20.
//

import Foundation

class BaekJoon2587 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var n = 0
        var nums = [Int]()
        
        while n < 5 {
            n += 1
            
            let inputNum = Int(readLine()!)!
            nums.append(inputNum)
        }
        nums.sort()
        
        var sum = 0
        let median = nums[nums.count / 2]
        
        nums.forEach {
            sum += $0
        }
        print(sum / 5)
        print(median)
    }
    
    func solution2() {
        var nums = [Int]()
        var sum = 0
        
        for _ in 0..<5 {
            let num = Int(readLine()!)!
            nums.append(num)
            sum += num
        }
        nums.sort()
        
        print(sum / 5)
        print(nums[nums.count / 2])
    }
    
    func solution3() {
        var nums = [Int]()
        var sum = 0
        
        for _ in 0..<5 {
            let num = Int(readLine()!)!
            nums.append(num)
            sum += num
        }
        nums.sort()
        
        print(sum / 5)
        print(nums[nums.count / 2])
    }
}
