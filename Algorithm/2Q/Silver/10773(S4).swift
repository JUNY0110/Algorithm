//
//  10773.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/19.
//

import Foundation

class BaekJoon10773 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 스택
    /// - IMPORTANT: 스택의 합
    
    func solution() {
        let count = Int(readLine()!)!
        var stack = [Int]()
        
        for _ in 0..<count {
            guard let input = readLine(), let num = Int(input) else { break }

            if num == 0 {
                stack.removeLast()
            } else {
                stack.append(num)
            }
        }
        print(stack.reduce(0, +))
    }
}
