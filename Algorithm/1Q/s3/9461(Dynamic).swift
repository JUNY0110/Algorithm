//
//  9461.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/20.
//

import Foundation

class BaekJoon9461 {
    func run() {
        solution2()
    }
    
    //        p1(1) + p5(2) = p6(3)
    //        p2(1) + p6(3) = p7(4)
    //        p3(1) + p7(4) = p8(5)
    //        p4(2) + p8(5) = p9(7)
    //        p5(2) + p9(7) = p10(9)
    //        p6(3) + p10(9) = p11(12)

    // MARK: - 69100kb / 20ms
    func solution1() {
        let num = Int(readLine()!)!
        var nums = [1,1,1] + [2,2] + Array(repeating: 0, count: 96)
        for _ in 0..<num {
            let n = Int(readLine()!)!
            if n >= 6{
                for i in 5..<n {
                    nums[i] = nums[i-5] + nums[i-1]
                }
            }
            print(nums[n-1])
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        var nums = [1,1,1,2,2] + Array(repeating: 0, count: 96)
        
        for _ in 0..<num { print(triangle(Int(readLine()!)!)) }
        
        func triangle(_ n: Int) -> Int {
            if n > 5 {
                for i in 5..<n { nums[i] = nums[i-5] + nums[i-1] }
            }
            return nums[n-1]
        }
    }
    
    func solution3() {
        _ = readLine()!
        var nums = [1,1,1,2,2] + Array(repeating: 0, count: 96)
    
        while let n = readLine() {
            (5...100).forEach { i in nums[i] = nums[i-1] + nums[i-5] }
            print(nums[Int(n)!-1])
        }
    }
}
