//
//  1475.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/09.
//

import Foundation

class BaekJoon3273 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 두 수의 합 갯수 구하기
    /// - IMPORTANT: 투포인터로 해결해야 한다. O(n^2)이 아닌 O(n) 시간 복잡도가 필요.
    
    func solution1() {
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        let sum = Int(readLine()!)!
        
        var p1 = 0, p2 = n - 1
        var result = 0
        
        while p1 < p2 {
            if sum == nums[p1] + nums[p2] {
                p1 += 1
                p2 -= 1
                result += 1
            } else if sum < nums[p1] + nums[p2] {
                p2 -= 1
            } else {
                p1 += 1
            }
        }
        print(result)
    }
    
    // 아래는 오답임.
    
    func solution2() {
        let _ = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let sum = Int(readLine()!)!
        var result = 0
                
        for num in nums {
            if nums.contains(sum - num) && (sum - num) > num {
                result += 1
            }
        }
        print(result)
    }
    
    func solution3() {
        let _ = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let sum = Int(readLine()!)!
        
        print(nums.filter{nums.contains(sum - $0) && sum - $0 > $0}.count)
    }
    
    func solution3() {
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        let sum = Int(readLine()!)!
        
        var p1 = 0, p2 = n-1
        var result = 0
        
        while p1 < p2 {
            if sum == nums[p1] + nums[p2] {
                p1 += 1
                p2 -= 1
                result += 1
            } else if sum < nums[p1] + nums[p2] {
                p2 -= 1
            } else {
                p1 += 1
            }
        }
        print(result)
    }
}
