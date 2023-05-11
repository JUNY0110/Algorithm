//
//  11399.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon11399 {
    func run() {
        solution()
    }
    
    func solution() {
        let _ = Int(readLine()!)!
        var p = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
        
        for i in 1..<p.count {
            p[i] += p[i-1]
        }

        print(p.reduce(0, +))
    }
}
