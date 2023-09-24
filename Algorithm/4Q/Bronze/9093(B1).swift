//
//  9093.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon9093 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        
        for _ in 0..<number {
            let sentence = readLine()!.split(separator: " ").map { String($0.reversed()) }
            print(sentence.joined(separator: " "))
        }
    }
}

