//
//  7568.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/15.
//

import Foundation

class BaekJoon7568 {
    func run() { solution2() }
    
    func solution1() {
        let num = Int(readLine()!)!
        var physicals = [[Int]]()
        var results = Array(repeating: 1, count: num)
        
        for _ in 0..<num {
            let physical = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let weight = physical[0]
            let height = physical[1]
            physicals.append([weight, height])
        }
        
        for i in 0..<num {
            for j in 0..<num {
                if physicals[i][0] < physicals[j][0] && physicals[i][1] < physicals[j][1] {
                    results[i] += 1
                }
            }
        }

        print(results.map {"\($0)"}.joined(separator: " "))
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        var physicals = Array(repeating: Array(repeating: 0, count: 2), count: num)
        var results = Array(repeating: 1, count: num)
        
        for i in 0..<num { physicals[i] = readLine()!.split(separator: " ").map{ Int(String($0))! } }
        
        for i in 0..<num {
            for j in 0..<num {
                if physicals[i][0] < physicals[j][0] && physicals[i][1] < physicals[j][1] { results[i] += 1 }
            }
        }
        print(results.map {"\($0)"}.joined(separator: " "))
    }
    
    func solution3() {
        let num = Int(readLine()!)!
        var physicals = Array(repeating: Array(repeating: 0, count: 2), count: num)
        var results = Array(repeating: 1, count: num)
        
        for i in 0..<num {
            for j in 0..<num {
                if !physicals[j].contains(0) { continue }
                physicals[j] = readLine()!.split(separator: " ").map{ Int(String($0))! }
            }
            
            for k in 0..<num {
                if physicals[i][0] < physicals[k][0] && physicals[i][1] < physicals[k][1] { results[i] += 1 }
            }
        }
        print(results.map {"\($0)"}.joined(separator: " "))
    }
}
