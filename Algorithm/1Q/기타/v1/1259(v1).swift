//
//  1259.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon1259 {
    func run() {
        solution1()
    }
    
    func solution1() {
        while true {
            let n = readLine()!
            
            if n == "0" { break }
            print(n == String(n.reversed()) ? "yes" : "no")
        }
    }
}
