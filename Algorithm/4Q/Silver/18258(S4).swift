//
//  18258.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon18258 {
    func run() {
        solution()
    }
    
    private func solution() {
        // 빠른 입력 FileIO
        final class FileIO {
            private var buffer:[UInt8]
            private var index: Int
            
            init(fileHandle: FileHandle = FileHandle.standardInput) {
                buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
                index = 0
            }
            
            @inline(__always) 
            private func read() -> UInt8 {
                defer { index += 1 }
                
                return buffer.withUnsafeBufferPointer { $0[index] }
            }
            
            @inline(__always) 
            func readInt() -> Int {
                var sum = 0
                var now = read()
                var isPositive = true
                
                while now == 10
                        || now == 32 { now = read() } // 공백과 줄바꿈 무시
                if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
                while now >= 48, now <= 57 {
                    sum = sum * 10 + Int(now-48)
                    now = read()
                }
                
                return sum * (isPositive ? 1:-1)
            }
            
            @inline(__always) 
            func readString() -> Int {
                var str = 0
                var now = read()
                
                while now == 10
                        || now == 32 { now = read() } // 공백과 줄바꿈 무시
                
                while now != 10
                        && now != 32 && now != 0 {
                    str += Int(now)
                    now = read()
                }
                
                return str
            }
        }
        
        struct Queue {
            var enqueue = [Int]()
            var dequeue = [Int]()
            
            var isEmpty: Bool {
                enqueue.isEmpty && dequeue.isEmpty
            }
            
            var count: Int {
                enqueue.count + dequeue.count
            }
            
            var front: Int? {
                if dequeue.isEmpty {
                    return enqueue.first
                }
                return dequeue.last
            }
            
            var back: Int? {
                if enqueue.isEmpty {
                    return dequeue.first
                }
                return enqueue.last
            }

            mutating func push(_ queue: Int) {
                enqueue.append(queue)
            }
            
            mutating func pop() -> Int? {
                if dequeue.isEmpty {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                }
                return dequeue.popLast()
            }
        }
        
        enum Command: Int {
            case push = 448
            case pop = 335
            case size = 443
            case empty = 559
            case front = 553
            case back = 401
        }
        
        let file = FileIO()
        let num = file.readInt()
        var queue = Queue()
        var result = ""
        
        for _ in 0..<num {
            let commands = file.readString()
            guard let command = Command(rawValue: commands) else { continue }
            
            switch command {
            case .push:
                let enqueue = file.readInt()
                queue.push(enqueue)
            case .pop:
                result += "\(queue.pop() ?? -1)\n"
            case .size:
                result += "\(queue.count)\n"
            case .empty:
                result += "\(queue.isEmpty ? 1 : 0)\n"
            case .front:
                result += "\(queue.front ?? -1)\n"
            case .back:
                result += "\(queue.back ?? -1)\n"
            }
        }
        print(result)
    }
}
