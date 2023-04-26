//
//  25305.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/20.
//

import Foundation

class BaekJoon25305 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
        let _ = conditions[0]
        let k = conditions[1]
        
        let scores = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
        
        print(scores[k - 1])
    }
    
    func solution2() {
        let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
        let scores = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
        
        print(scores[conditions[1] - 1])
    }
}
