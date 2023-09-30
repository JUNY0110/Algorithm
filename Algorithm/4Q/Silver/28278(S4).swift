//
//  28278.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/29.
//

import Foundation

class BaekJoon28278 {
    func run() {
        solution()
    }
    
    private enum Command: Int {
        case push = 1
        case pop = 2
        case stackCount = 3
        case checkEmpty = 4
        case outputLastNumber = 5
    }
    
    private func solution() {
        let commandCount = Int(readLine()!)!
        var stack = [Int]()
        
        for _ in 0..<commandCount {
            let fullCommand = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let command = Command(rawValue: fullCommand[0]) else { continue }
            
            switch command {
            case .push:
                let number = fullCommand[1]
                stack.append(number)
            case .pop:
                guard let popValue = stack.popLast() else {
                    print(-1)
                    continue
                }
                print(popValue)
            case .stackCount:
                print(stack.count)
            case .checkEmpty:
                print(stack.isEmpty ? 1 : 0)
            case .outputLastNumber:
                guard let lastValue = stack.last else {
                    print(-1)
                    continue
                }
                print(lastValue)
            }
        }
    }
}
