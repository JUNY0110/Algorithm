//
//  2446.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation

class BaekJoon2446 {
    func run() {
        solution()
    }
    
    private func solution() {
        guard let num = Int(String(readLine()!)) else { return }
        
        for i in 0..<num {
            print(String(repeating: " ", count: i), terminator: "")
            print(String(repeating: "*", count: 2*(num-i)-1))
        }
        
        for i in 1..<num {
            print(String(repeating: " ", count: num-i-1), terminator: "")
            print(String(repeating: "*", count: 2*i+1))
        }
    }
}
