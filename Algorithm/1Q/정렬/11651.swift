//
//  11651.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon11651 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let n = Int(readLine()!)!
        var numTuples = [(x: Int, y: Int)]()
        
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            numTuples.append((xy[0], xy[1]))
        }
        numTuples.sort(by: {($0.y == $1.y) ? ($0.x < $1.x) : ($0.y < $1.y)})
        print(numTuples.map{"\($0.x) \($0.y)"}.joined(separator: "\n"))
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        var numTuples = [(x: Int, y: Int)]()
        
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            numTuples.append((xy[1], xy[0]))
        }
        numTuples.sort(by: <)
        print(numTuples.map{"\($0.y) \($0.x)"}.joined(separator: "\n"))
    }
}
