//
//  1138.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon1138 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let n = Int(readLine()!)!
        var positions = readLine()!.split(separator: " ").compactMap{ Int($0) }
        var result = Array(repeating: Int.max, count: n)
        
        for i in 0..<n {
            var index = 0
            
            while positions[i] > 0 || result[index] < i + 1 {
                if result[index] > i+1 {
                    positions[i] -= 1
                }
                index += 1
            }
            
            result[index] = i+1
        }
        print(result.map { String($0) }.joined(separator: " "))
    }
    
    private func solution2() {
        let n = Int(readLine()!)!
        let positions = readLine()!.split(separator: " ").compactMap{ Int($0) }
        var result = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            var index = 0
            var count = -1
            
            while count < positions[i] {
                if result[index] == 0 {
                    count += 1
                }
                index += 1
            }
            
            result[index-1] = i+1
        }
        print(result.map { String($0) }.joined(separator: " "))
    }
}
