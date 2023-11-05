//
//  20650.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation


final class BaekJoon20650 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
        var result = [nums[0], nums[1]]
        result.append(nums.last! - (nums[0] + nums[1]))
        
        print(result.map { String($0) }.joined(separator: " "))
    }
}
