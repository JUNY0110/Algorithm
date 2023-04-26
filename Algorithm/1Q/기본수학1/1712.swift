//
//  1712.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/05.
//

import Foundation

class BaekJoon1712 {
    func run() {
        solution1()
    }
    
    func solution1() {
        if let condition = readLine()?.split(separator: " ").map ({ String($0) }),
           let A = Int(condition[0]),
           let B = Int(condition[1]),
           let C = Int(condition[2]) {
            var x = 0
            
            if B >= C {
                x = -1
            } else {
                x =  A / ( C - B ) + 1
            }
            print(x)
        }
    }
}
