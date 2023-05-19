//
//  10828.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/19.
//

import Foundation

class BaekJoon10828 {
    func run() {
        solution()
    }
    /// - NOTE: 문제풀이. 스택
    /// - IMPORTANT: LIFO에 대한 개념적 이해
    
    func solution() {
        var stack = [Int]()
        
        for _ in 0..<Int(readLine()!)! {
            let command = readLine()!.split(separator: " ").map { String($0) }
            
            switch command[0] {
            case "push": stack.append(Int(command[1])!)
            case "pop": print(stack.isEmpty ? -1 : stack.removeLast())
            case "size": print(stack.count)
            case "empty": print(stack.isEmpty ? 1 : 0)
            case "top": print(stack.last ?? -1)
            default: continue
            }
        }
    }
}
