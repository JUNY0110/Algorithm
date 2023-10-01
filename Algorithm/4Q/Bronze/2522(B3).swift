//
//  2522.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon2522 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            print(String(repeating: " ", count: num-i), terminator: "")
            print(String(repeating: "*", count: i))
        }
        for i in 1..<num {
            print(String(repeating: " ", count: i), terminator: "")
            print(String(repeating: "*", count: num-i))
        }
    }
}
