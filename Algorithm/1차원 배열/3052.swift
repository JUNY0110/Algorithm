//
//  3052.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

class baekJoon3052 {
    func run() {
        solution()
    }
    
    func solution() {
        var intSet = Set<Int>()
        
        for _ in 0..<10 {
            if let input = readLine(),
               let intValue = Int(input) {
                intSet.insert(intValue % 42)
            }
        }
        print(intSet.count)
    }
}
