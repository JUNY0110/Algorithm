//
//  2869.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/06.
//

import Foundation

class BaekJoon2869 {
    func run() {
        solution()
    }
    
    func solution() {
        if let input = readLine() {
            let conditions = input.split(separator: " ").map { Int(String($0))! }
            let a = conditions[0], b = conditions[1], v = conditions[2]
            
            print(Int(ceil(Double(v-a) / Double(a-b)) + 1))
        }
    }
}
