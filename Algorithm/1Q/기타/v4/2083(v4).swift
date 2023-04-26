//
//  2083.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon2083 {
    func run() {
        solution()
    }
    
    func solution() {
        while true {
            let nums = readLine()!.split(separator: " ")
            let name = nums[0]
            let age = Int(nums[1])!
            let weight = Int(nums[2])!
            
            if nums == ["#", "0", "0"] { break }
            
            print(name, age > 17 || weight >= 80 ? "Senior" : "Junior")
        }
    }
}
