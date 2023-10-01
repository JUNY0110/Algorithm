//
//  14696.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon14696 {
    func run() {
        solution2()
    }
    
    // 딱지놀이
    enum Ttakji: Substring, CaseIterable {
        case star = "4"
        case circle = "3"
        case square = "2"
        case triagle = "1"
    }
    
    private func solution() {
        let round = Int(readLine()!)!

    outLoop: for _ in 0..<round {
        var childA = readLine()!.split(separator: " ").compactMap { Ttakji(rawValue: $0) }
        var childB = readLine()!.split(separator: " ").compactMap { Ttakji(rawValue: $0) }
        childA.removeFirst()
        childB.removeFirst()
        
        for ttakji in Ttakji.allCases {
            switch (childA.filter{ $0 == ttakji }.count, childB.filter{ $0 == ttakji }.count) {
            case let (a, b) where a > b:
                print("A")
                continue outLoop
            case let (a, b) where a < b:
                print("B")
                continue outLoop
            default: continue
            }
        }
        print("D")
    }
        
    }
    
    private func solution2() {
        let round = Int(readLine()!)!
        
    outLoop: for _ in 0..<round {
        var childA = readLine()!.split(separator: " ").compactMap { Int($0) }
        var childB = readLine()!.split(separator: " ").compactMap { Int($0) }
        childA.removeFirst()
        childB.removeFirst()
        
        let max = max(childA.max() ?? 1, childB.max() ?? 1)
        
        for num in stride(from: max, through: 1, by: -1) {
            switch (childA.filter{ $0 == num }.count, childB.filter{ $0 == num }.count) {
            case let (a, b) where a > b:
                print("A")
                continue outLoop
            case let (a, b) where a < b:
                print("B")
                continue outLoop
            default: continue
            }
        }
        print("D")
    }
        
    }
}
