//
//  10810.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/21.
//

import Foundation

class BaekJoon10810 {
    func run() { solution() }
    // 3 3
    // 0 0 4 4 0
    // 1 1 1 1 0
    // 0 2 0 0 0
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var arr = Array(repeating: 0, count: nums[0])
        
        for _ in 0..<nums[1] {
            let goals = readLine()!.split(separator: " ").map { Int(String($0))! }
            for j in goals[0]-1..<goals[1] { arr[j] = goals[2] }
        }
        print(arr.map{"\($0)"}.joined(separator: " "))
    }
}
