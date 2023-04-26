//
//  5532.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon5532 {
    func run() {
        solution()
    }
    
    func solution() {
        let vacation = Int(readLine()!)!
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let c = Int(readLine()!)!
        let d = Int(readLine()!)!
        var study = c + d
        var n = 0
        
        while a + b > study {
            study = (c + d) * n
            n += 1
        }
        print(vacation - n)
    }
}
