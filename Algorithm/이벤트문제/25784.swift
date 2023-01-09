//
//  25784.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/06.
//

import Foundation

class BaekJoon25784 {
    func run() {
        solution2()
    }
    
    func solution1() {
        if let input = readLine() {
            let conditions = input.split(separator: " ").map { Int(String($0))! }
            let a = conditions[0], b = conditions[1], c = conditions[2]
            
            if a + b == c || a + c == b || b + c == a {
                print(1)
            } else if  a * b == c || a * c == b || b * c == a {
                print(2)
            } else {
                print(3)
            }
        }
    }
    
    func solution2() {
        if let input = readLine() {
            let conditions = input.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
            let a = conditions[0], b = conditions[1], c = conditions[2]
            
            if b + c == a {
                print(1)
            } else if b * c == a {
                print(2)
            } else {
                print(3)
            }
        }
    }
}
