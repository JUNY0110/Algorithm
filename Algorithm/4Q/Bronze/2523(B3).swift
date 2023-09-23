//
//  2523.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation

class BaekJoon2523 {
    func run() {
        solution()
    }
    
    private func solution() {
        guard let num = Int(readLine()!) else { return }
        
        for i in 1...num {
            print(String(repeating: "*", count:i))
        }
        for i in 1..<num {
            print(String(repeating: "*", count: num-i))
        }
    }
}
