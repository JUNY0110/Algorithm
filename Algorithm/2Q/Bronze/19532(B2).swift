//
//  19532.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/30.
//

import Foundation

class BaekJoon19532 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 연립방정식의 x, y 의 해 구하기
    /// - IMPORTANT: 대입법, 가감법
    
    /*
     ax + by = c
     dx + ey = f
     */
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = nums[0], b = nums[1], c = nums[2], d = nums[3], e = nums[4], f = nums[5]
        let scope = Array<Int>(-999...999)
        
        OuterLoop: for x in scope {
            for y in scope {
                if (a * x) + (b * y) == c && (d * x) + (e * y) == f {
                    print(x, y)
                    break OuterLoop
                }
            }
        }
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = nums[0], b = nums[1], c = nums[2], d = nums[3], e = nums[4], f = nums[5]
        
        let x = (c*e - b*f) / (a*e - b*d)
        let y = (c*d - a*f) / (b*d - a*e)
        
        print(x, y)
    }
}
