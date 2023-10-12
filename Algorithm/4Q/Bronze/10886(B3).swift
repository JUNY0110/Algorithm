//
//  10886.swift
//  Algorithm
//
//  Created by 지준용 on 10/12/23.
//

import Foundation


final class BaekJoon10886 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        var result = [Bool: Int]()
        
        for _ in 0..<num {
            let opinion = readLine()! == "1" ? true : false
            result[opinion, default: 0] += 1
        }
        
        print((result[true] ?? 0 > result[false] ?? 0) ? "Junhee is cute!" : "Junhee is not cute!")
    }
}
