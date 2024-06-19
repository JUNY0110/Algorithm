//
//  16953.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon16953 {
    func run() {
        solution()
    }
    
    // MARK: - A -> B(그리디)
    private func solution() {
        let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = ab[0]
        var b = ab[1]
        var count = 1
        
        while a < b {
            if b % 2 == 0 {
                b /= 2
            } else {
                if b % 10 == 1 {
                    b /= 10
                } else {
                    break
                }
            }
            count += 1
        }
        
        print(a == b ? count : -1)
    }
}
