//
//  2798.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/10.
//

import Foundation

class BaekJoon2798 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var results = [Int]()
        
        for i in 0..<conditions[0] {
            for j in 0..<conditions[0] where (j != i) {
                for k in 0..<conditions[0] where (k != i) && (k != j) {
                    results.append(nums[i] + nums[j] + nums[k])
                }
            }
        }
        print(results.filter{$0 <= conditions[1]}.max()!)
    }
    
    func solution2() {
        let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var sum = 0
        var result = 0
        
        for i in 0..<conditions[0] - 2 {
            for j in i+1..<conditions[0] - 1 {
                for k in j+1..<conditions[0] {
                    sum = nums[i] + nums[j] + nums[k]
                    if result...conditions[1] ~= sum {
                        result = sum
                    }
                }
            }
        }
        print(result)
    }
}
