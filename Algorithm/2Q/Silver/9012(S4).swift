//
//  9012.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/19.
//

import Foundation

class BaekJoon9012 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 괄호
    /// - IMPORTANT:괄호가 닫히면"( )" 괄호를 삭제
    
    func solution() {
        let count = Int(readLine()!)!
        
        for _ in 0..<count {
            var stack = ""

            for ps in readLine()! {
                stack += String(ps)

                if stack.suffix(2) == "()" {
                    stack.removeLast(2)
                }
            }
            print(stack.isEmpty ? "YES" : "NO")
        }
    }
}
