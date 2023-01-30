//
//  10870.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/22.
//

import Foundation

class BaekJoon10870 {
    
    func run() {
        solution()
    }
    
    func solution() {
        func fibonacci(_ n: Int) -> Int {
            if n > 1 {
                return fibonacci(n-1) + fibonacci(n-2)
            } else {
                return n
            }
            
        }

        let num = Int(readLine()!)!
        print(fibonacci(num))
    }
}
