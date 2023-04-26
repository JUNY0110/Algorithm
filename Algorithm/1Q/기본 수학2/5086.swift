//
//  5086.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/22.
//

import Foundation

class BaekJoon5086 {
    func run() { solution() }
    
    func solution() {
        while let nums = readLine()?.split(separator: " ").map ({ Int(String($0))! }),
              nums[0] != 0 && nums[1] != 0 {
            print(nums[1].isMultiple(of: nums[0]) ? "factor" :
                    nums[0].isMultiple(of: nums[1]) ? "multiple" : "neither")
        }
    }
}
