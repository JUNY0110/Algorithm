//
//  25314.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/21.
//

import Foundation

class BaekJoon25314 {
    func run() { solution() }
    
    func solution() {
        let num = Int(readLine()!)! / 4
        let array = Array(repeating: "long", count: num)
        
        print(array.map{$0}.joined(separator: " "), "int")
    }
}
