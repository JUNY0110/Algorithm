//
//  10826.swift
//  Algorithm
//
//  Created by 지준용 on 11/8/23.
//

import Foundation


final class BaekJoon10826 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        
        if n < 2 {
            print(n)
        } else {
            var result = ([0], [1])
            
            for _ in 1..<n {
                var temp = (result.1 + [0], [Int]())
                var decimal = 0
                var next = [Int]()
                
                zip(result.0 + [0], temp.0).forEach {
                    next.append(($0 + $1 + decimal) % 10)
                    decimal = ($0 + $1 + decimal) < 10 ? 0 : 1
                }
                temp.1 = next
                
                if temp.1.last == 0 {
                    temp.1.removeLast()
                    temp.0.removeLast()
                }
                result = temp
            }
            print(result.1.map { String($0) }.reversed().joined())
        }
    }
}
