//
//  4134.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/08.
//

import Foundation

class BaekJoon4134 {
    func run() {
        solution()
    }
    
    func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            var n = Int(readLine()!)!
            
            if n < 2 {
                print(2)
                continue
            }
            
            while true {
                var isPrime = true
                var value = 2

                while value * value <= n {
                    if n % value == 0 {
                        isPrime = false
                        break
                    }
                    value += 1
                }

                if isPrime {
                    print(n)
                    break
                }
                n += 1
            }
        }
    }
}
