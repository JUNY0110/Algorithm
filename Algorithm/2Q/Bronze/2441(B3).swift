//
//  2441.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon2441 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 별찍기
    
    func solution() {
        let n = Int(readLine()!)!
        
        for i in stride(from: n ,to: 0, by: -1) {
            print(String(repeating: " ", count: n - i), terminator: "")
            print(String(repeating: "*", count: i))
        }
    }
}
