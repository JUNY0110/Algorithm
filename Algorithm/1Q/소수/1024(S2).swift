//
//  2153.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/08.
//

import Foundation

class BaekJoon2153 {
    func run() {
        solution()
    }
    
    func solution() {

        var isPrime = true
        var value = 2
        
        while value * value <= 10000 {
            if 10000 % value == 0 {
                isPrime = false
            }
            value += 1
        }
        
    }
}
