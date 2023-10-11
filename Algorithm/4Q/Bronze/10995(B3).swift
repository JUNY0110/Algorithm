//
//  10995.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon10995 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            if i % 2 == 1 {
                print(String(repeating: "* ", count: num))
            }
            if i % 2 == 0 {
                print(String(repeating: " *", count: num))
            }
        }
    }
}
