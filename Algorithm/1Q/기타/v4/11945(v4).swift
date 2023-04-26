//
//  11945.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon11945 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        for _ in 0..<nums[0] { print(String(readLine()!.reversed())) }
    }
}
