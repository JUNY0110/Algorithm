//
//  10866.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/27.
//

import Foundation

class BaekJoon10866 {
    func run() {
        solution()
    }
    
    enum Command: String {
        case pushFrontX = "push_front"
        case pushBackX = "push_back"
        case popFront = "pop_front"
        case popBack = "pop_back"
        case size = "size"
        case empty = "empty"
        case front = "front"
        case back = "back"
    }
    
    private func solution() {
        let count = Int(readLine()!)!
        var deque = [Int]()
        
        for _ in 0..<count {
            guard let input = readLine() else { continue }
            let commands = input.split(separator: " ").map{ String($0) }
            
            commandResult(of: commands)
        }
        
        func commandResult(of commands: [String]) {
            guard let command = Command(rawValue: commands[0]) else { return }
            
            switch command {
            case .pushFrontX:
                deque.insert(Int(commands[1])!, at: 0)
            case .pushBackX:
                deque.append(Int(commands[1])!)
            case .popFront:
                if deque.isEmpty {
                    return print(-1)
                }
                let removal = deque.removeFirst()
                print(removal)
            case .popBack:
                if deque.isEmpty {
                    return print(-1)
                }
                let removal = deque.removeLast()
                print(removal)
            case .size:
                print(deque.count)
            case .empty:
                if deque.isEmpty {
                    return print(1)
                }
                print(0)
            case .front:
                guard let first = deque.first else {
                    return print(-1)
                }
                print(first)
            case .back:
                guard let last = deque.last else {
                    return print(-1)
                }
                print(last)
            }
        }
    }
}
