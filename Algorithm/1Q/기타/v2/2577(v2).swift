//
//  2577.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/11.
//

import Foundation

class BaekJoon2577 {
    func run() {
        solution()
    }
    
    func solution() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let c = Int(readLine()!)!
        let multiple = a * b * c
        
        var array = Array(repeating: 0, count: 10)
        
        for i in String(multiple) {
            for j in 0..<array.count {
                if Int(String(i))! == j {
                    array[j] += 1
                }
            }
        }
        print(array.map{"\($0)"}.joined(separator: "\n"))
    }
}
