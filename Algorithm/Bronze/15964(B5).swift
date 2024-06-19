//
//  15964.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon15964 {
    func run() {
        solution()
    }
    
    // MARK: - 이상한 기호
    private func solution() {
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
        let result = (nums[0] + nums[1]) * (nums[0] - nums[1])
        print(result)
    }
}
