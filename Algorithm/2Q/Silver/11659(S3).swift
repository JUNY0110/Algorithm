//
//  11659.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon11659 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 누적합
    /// - IMPORTANT: 계산 범위가 넓을 때, 시간복잡도를 O(n^2)에서 줄이는 방법
    
    // 시간복잡도 O(2n) + O(m)
    
    func solution1() {
        let count = readLine()!.split(separator: " ").map{ Int($0)! }
        var nums = readLine()!.split(separator: " ").map{ Int($0)! }
        
        for i in 1..<nums.count {
            nums[i] += nums[i - 1]
        }
        
        nums.insert(0, at: 0)

        for _ in 0..<count[1] {
            let range = readLine()!.split(separator: " ").map{ Int($0)! }
            print( nums[range[1]] - nums[range[0] - 1] )
        }
    }
    
    // 시간복잡도 O(n) + O(m)
    
    func solution2() {
        let condition = readLine()!.split(separator: " ").map { Int(String($0))! }
        let n = condition[0]
        let m = condition[1]
        
        let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
        var psum = Array(repeating: nums[0], count: n)
        
        for i in 1..<n {
            psum[i] = psum[i-1] + nums[i]
        }
        
        var result = ""
        
        for _ in 0..<m {
            let range = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
            let low = range[0]
            let high = range[1]
            
            let sumFromLowToHigh = psum[high] - (low == 0 ? 0 : psum[low - 1])
            result.write("\(sumFromLowToHigh)\n")
        }
        print(result)
    }
    
    // 시간복잡도 O(n^2)
    
    func solution3() {
        let condition = readLine()!.split(separator: " ").map { Int(String($0))! }
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for _ in 0..<condition[1] {
            let range = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
            print(nums[range[0]...range[1]].reduce(0, +))
        }
    }
}
