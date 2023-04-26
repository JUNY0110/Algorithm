//
//  5596.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon5596 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let aScores = readLine()!.split(separator: " ").map { Int(String($0))! }
        let bScores = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        print([aScores.reduce(0, +),bScores.reduce(0, +)].max()!)
    }
    
    func solution2() {
        let aScores = readLine()!.split(separator: " ").map { Int(String($0))! }
        let bScores = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        print([aScores.reduce(0, +),bScores.reduce(0, +)].sorted(by: <)[1])
    }
}
