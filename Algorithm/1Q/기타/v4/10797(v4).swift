//
//  10797.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon10797 {
    func run() {
        solution()
    }
    
    func solution() {
        let num = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var result = 0
        
        nums.forEach {
            if $0 == num { result += 1 }
        }
        print(result)
    }
}
