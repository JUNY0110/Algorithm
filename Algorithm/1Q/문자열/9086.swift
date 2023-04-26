//
//  9086.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/23.
//

import Foundation

class BaekJoon9086 {
    func run() {
        solution()
    }
    
    func solution() {
        for _ in 1...Int(readLine()!)! {
            let input = String(readLine()!)
            print("\(input.first!)\(input.last!)")
        }
    }
}
