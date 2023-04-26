//
//  4101.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon4101 {
    func run() {
        solution()
    }
    
    func solution() {
        while true {
            let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
            if nums[0] == 0 && nums[1] == 0 { break }
            print(nums[0] > nums[1] ? "Yes" : "No")
        }
    }
}
