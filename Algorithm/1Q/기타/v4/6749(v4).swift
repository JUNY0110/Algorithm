//
//  6749.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon6749 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let third = Int(readLine()!)!
        let second = Int(readLine()!)!
        print(second + second - third)
    }
}
