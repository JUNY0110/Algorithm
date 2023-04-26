//
//  5522.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon5522 {
    func run() {
        solution()
    }
    
    func solution() {
        var sum = 0
        for _ in 0..<5 {
            sum += Int(readLine()!)!
        }
        print(sum)
    }
}
