//
//  4673.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/28.
//

import Foundation

class BaekJoon4673 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let totalArray = Array<Int>(1...10000)
        
        var results = Array<Int>()
        var sequenceArray: [Int] = []
        var tempArray: [String] = []
        
        func sequence() {
            
            totalArray.forEach {
                
                if $0 >= 1000 && $0 < 10000 {
                    sequenceArray.append($0 + Int($0/1000) + Int($0/100) % 10 + Int($0/10) % 10 + Int($0 % 10))
                } else if $0 >= 100 {
                    sequenceArray.append($0 + Int($0/100) + Int($0/10) % 10 + Int($0 % 10))
                } else if $0 >= 10 {
                    sequenceArray.append($0 + Int($0/10) % 10 + Int($0 % 10))
                } else {
                    sequenceArray.append($0 + $0)
                }
            }
            sequenceArray.sort()
            results = totalArray.filter { !sequenceArray.contains($0) }
            
            results.forEach {
                print($0)
            }
        }
        sequence()
    }
    
}
