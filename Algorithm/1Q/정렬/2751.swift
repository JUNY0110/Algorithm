//
//  2751.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/20.
//

import Foundation

class BaekJoon2751 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        var nums = [Int]()
        
        for _ in 0..<n {
            nums.append(Int(readLine()!)!)
        }
        print(nums.sorted(by: <).map {String($0)}.joined(separator: "\n"))
    }
}
