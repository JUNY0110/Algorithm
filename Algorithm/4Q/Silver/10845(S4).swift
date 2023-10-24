//
//  10845.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon10845 {
    func run() {
        solution()
    }
    
    private func solution() {
        class Queue {
            var enqueue: [String]
            var dequeue: [String] = []
            
            var count: Int {
                enqueue.count + dequeue.count
            }
            
            var isEmpty: Bool {
                enqueue.isEmpty && dequeue.isEmpty
            }
            
            var front: String? {
                if dequeue.isEmpty {
                    return enqueue.first
                }
                return dequeue.last
            }
            
            var back: String? {
                if enqueue.isEmpty {
                    return dequeue.first
                }
                return enqueue.last
            }
            
            init(enqueue: [String]) {
                self.enqueue = enqueue
            }
            
            func push(_ queue: String) {
                enqueue.append(queue)
            }
            
            func pop() -> String? {
                if dequeue.isEmpty {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                }
                return dequeue.popLast()
            }
        }
        
        enum Command: String {
            case push
            case pop
            case size
            case empty
            case front
            case back
        }
        
        let num = Int(readLine()!)!
        let queue = Queue(enqueue: [])
        
        for _ in 0..<num {
            let commands = readLine()!.split(separator: " ").map { String($0) }
            guard let command = Command(rawValue: commands[0]) else { continue }
            
            switch command {
            case .push:
                let enqueue = commands[1]
                queue.push(enqueue)
            case .pop:
                print(queue.pop() ?? -1)
            case .size:
                print(queue.count)
            case .empty:
                print(queue.isEmpty ? 1 : 0)
            case .front:
                print(queue.front ?? -1)
            case .back:
                print(queue.back ?? -1)
            }
        }
    }
    private func solution2() {
        
        enum Command: String {
            case push
            case pop
            case size
            case empty
            case front
            case back
        }
        
        let num = Int(readLine()!)!
        var queue = [String]()
        
        for _ in 0..<num {
            let commands = readLine()!.split(separator: " ").map { String($0) }
            guard let command = Command(rawValue: commands[0]) else { continue }
            
            switch command {
            case .push:
                let enqueue = commands[1]
                queue.insert(enqueue, at: 0)
            case .pop:
                print(queue.popLast() ?? -1)
            case .size:
                print(queue.count)
            case .empty:
                print(queue.isEmpty ? 1 : 0)
            case .front:
                print(queue.last ?? -1)
            case .back:
                print(queue.first ?? -1)
            }
        }
    }
}
