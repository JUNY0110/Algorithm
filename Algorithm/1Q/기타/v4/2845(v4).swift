//
//  2845.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon2845 {
    func run() {
        solution()
    }
    
    func solution() {
        let lp = readLine()!.split(separator: " ").map { Int(String($0))! }
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var results = [Int]()
        
        nums.forEach { results.append($0 - lp[0] * lp[1]) }
        print(results.map{"\($0)"}.joined(separator: " "))
    }
}
