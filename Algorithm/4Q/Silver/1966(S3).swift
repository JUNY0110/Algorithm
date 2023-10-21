//
//  1966.swift
//  Algorithm
//
//  Created by 지준용 on 10/16/23.
//

import Foundation


final class BaekJoon1966 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)! // testCase 갯수
        
        for _ in 0..<t {
            let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
            var n = nm[0], m = nm[1] // 문서갯수, 인쇄순서가 궁금한 문서가 현재 놓여있는 위치
            var queue = readLine()!.split(separator: " ").compactMap { Int($0) }
            var result = 0
            
            while n > 0 {
                let firstQueue = queue[0]
                
                if queue.contains(where: {$0 > firstQueue}) {
                    let enqueue = queue.removeFirst()
                    queue.append(enqueue)
                    m -= 1
                    
                    if m < 0 {
                        m = n-1
                    }
                    continue
                }
                
                result += 1
                
                if m == 0 {
                    break
                }
                
                m -= 1
                n -= 1
                queue.removeFirst()
            }
            print(result)
        }
    }
    
    private func solution2() {
        let t = Int(readLine()!)! // testCase 갯수

        for _ in 0..<t {
            let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
            var queue = readLine()!.split(separator: " ").enumerated().map { (index: $0, element: Int($1)!) }
            var result = 0
            
            while true {
                let dequeue = queue.removeFirst()
                
                if queue.contains(where: { $0.element > dequeue.element }) {
                    queue.append(dequeue)
                    continue
                }
                result += 1
                
                if dequeue.index == nm[1] {
                    print(result)
                    break
                }
            }
        }
    }
}
