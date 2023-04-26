//
//  1.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/23.
//

import Foundation

class SK1 {
    func run() {
        solution()
    }
    func solution() {
        let num = Int(readLine()!)!

        for _ in 0..<num { print(String(repeating: "*", count: num)) }
    }
}
