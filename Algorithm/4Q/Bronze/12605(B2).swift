//
//  12605.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation

class BaekJoon12605 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        
        for i in 1...number {
            let input = readLine()!.split(separator: " ").map { String($0) }
            print("Case #\(i): \(input.reversed().joined(separator: " "))")
        }
    }
}
