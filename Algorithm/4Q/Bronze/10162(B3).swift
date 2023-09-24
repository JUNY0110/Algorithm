//
//  10162.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation

class BaekJoon10162 {
    func run() {
        solution()
    }
    
    private func solution() {
        var time = Int(readLine()!)!
        let operatingTime = [300, 60, 10]
        var result = [Int]()
        
        if time % 10 != 0 {
            print(-1)
        } else {
            for second in operatingTime {
                let minCount = time / second
                result.append(minCount)
                
                print(minCount, terminator: " ")
                
                time %= second
            }
        }
    }
}
