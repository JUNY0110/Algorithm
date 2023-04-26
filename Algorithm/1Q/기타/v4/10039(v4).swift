//
//  10039.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon10039 {
    func run() {
        solution1()
    }
    
    func solution1() {
        var sum = 0
        for _ in 0..<5 {
            var num = Int(readLine()!)!
            if num < 40 { num = 40 }
            sum += num
        }
        print(sum / 5)
    }
}
