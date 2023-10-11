//
//  10996.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon10996 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for _ in 1...num {
            print(String(repeating: "* ", count: (num / 2) + (num % 2)))
            print(String(repeating: " *", count: num / 2))
        }
    }
}
