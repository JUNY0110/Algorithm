//
//  2442.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon2442 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 별찍기
    
    func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            print(String(repeating: " ", count: num-i), terminator: "")
            print(String(repeating: "*", count: i * 2 - 1))
        }
    }
}
