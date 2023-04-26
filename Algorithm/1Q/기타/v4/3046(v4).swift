//
//  3046.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon3046 {
    func run() {
        solution()
    }
    
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        print(2 * nums[1] - nums[0])
    }
}
