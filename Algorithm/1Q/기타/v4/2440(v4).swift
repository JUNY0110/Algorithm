//
//  2440.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon2440 {
    func run() {
        solution()
    }
    
    func solution() {
        let num = Int(readLine()!)!
        let star = "*"
        
        for i in 1...num { print(String(repeating: star, count: num + 1 - i)) }
    }
}
