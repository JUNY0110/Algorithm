//
//  1065.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/29.
//

import Foundation

class BaekJoon1065 {
    func run() {
        solution2()
    }
    
    func solution1() {
        if let input = readLine(),
           let maxValue = Int(input) {
            
            let IntArray = Array<Int>(1...maxValue)
            var result = 0
            
            IntArray.forEach {
                if $0 < 100 {
                    result += 1
                } else if ($0 / 100) - ($0 / 10 % 10) == ($0 / 10 % 10) - ($0 % 10) {
                    result += 1
                }
            }
            
            print(result)
        }
    }
    
    func solution2() {
        if let input = readLine(),
           let maxValue = Int(input) {
            var result = 0
            
            for num in 1...maxValue {
                if checkHansoo(num: num) {
                    result += 1
                }
            }
            print(result)
            
            func checkHansoo(num: Int) -> Bool {
                
                if num < 100 {
                    return true
                }
                
                if (num / 100) - (num / 10 % 10) == (num / 10 % 10) - (num % 10) {
                    return true
                } else {
                    return false
                }
            }
        }
    }
}
