//
//  10872.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon10872 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let input = readLine()!
        if input == "0" {
            print(1)
        } else {
            let num = Array(1...Int(input)!)
            print(num.reduce(1, *))
        }
    }
    
    func solution2() {
        func factorial(_ n: Int) -> Int {
            if n > 1 {
                return n * factorial(n - 1)
            } else {
                return 1
            }
        }
        
        let input = Int(readLine()!)!
        print(factorial(input))
    }
}
