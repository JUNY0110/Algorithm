//
//  27160.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/04.
//

import Foundation


final class BaekJoon27160 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        var fruitDict = [String: Int]()
        
        for _ in 0..<number {
            let halliGalli = readLine()!.split(separator: " ").map { String($0) }
            let fruit = halliGalli[0]
            guard let quantity = Int(halliGalli[1]) else { continue }
            
            fruitDict[fruit, default: 0] += quantity
        }
        
        print(fruitDict.values.contains(5) ? "YES" : "NO")
    }
}
