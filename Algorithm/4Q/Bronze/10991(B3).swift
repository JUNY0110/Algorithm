//
//  10991.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon10991 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            print(String(repeating: " ", count: num-i), terminator: "")
            print("*", terminator: "")
            print(String(repeating: " *", count: i-1))
        }
    }
}
