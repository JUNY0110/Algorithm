//
//  2292.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/05.
//

import Foundation

class BaekJoon2292 {
    func run() {
        solution1()
    }
    
    func solution1() {
        if let input = readLine(),
           let num = Int(input) {
            var n = 0
            
            if num == 1 {
                n = 1
            } else {
                while num > 1 + 6 * ((n - 1) * n / 2) {
                    n += 1
                }
            }
            print(n)
        }
    }
    
    func solution2() {
        if let input = readLine(),
           let num = Int(input) {
            var n = 0, sum = 0
            
            while sum < num {
                sum += 6*n
                n += 1
            }
            print(n)
        }
    }
}
