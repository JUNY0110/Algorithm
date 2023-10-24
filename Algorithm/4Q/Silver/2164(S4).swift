//
//  2164.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon2164 {
    func run() {
        solution()
    }
    
    private func solution() {
        class Queue {
            private var enqueue: [Int]
            private var dequeue: [Int] = []
            
            var isEmpty: Bool {
                return enqueue.isEmpty && dequeue.isEmpty
            }
            
            var count: Int {
                return enqueue.count + dequeue.count
            }
            
            init(enqueue: [Int]) {
                self.enqueue = enqueue
            }
            
            func push(_ queue: Int) {
                enqueue.append(queue)
            }
            
            func pop() -> Int? {
                if dequeue.isEmpty {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                }
                return dequeue.popLast()
            }
        }
        
        let n = Int(readLine()!)!
        let cards = Array(1...n)
        let queue = Queue(enqueue: cards)
        
        while queue.count > 1 {
            _ = queue.pop()
            
            if let card = queue.pop() {
                queue.push(card)
            }
        }
        
        if let result = queue.pop() {
            print(result)
        }
    }
}
