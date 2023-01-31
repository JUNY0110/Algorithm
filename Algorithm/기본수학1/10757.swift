//
//  10757.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/31.
//

import Foundation

class BaekJoon10757 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { String($0) }
        var a = nums[0].map { Int(String($0))! }
        var b = nums[1].map { Int(String($0))! }
        
        for _ in 0..<abs(a.count - b.count) {
            (a.count > b.count) ? (b.insert(0, at: 0)) : (a.insert(0, at: 0))
        }
        
        for i in 0 ..< a.count { a[i] += b[i] }

        for i in (1 ..< a.count).reversed() {
            if a[i] >= 10 {
                a[i-1] += 1
            }
            a[i] = a[i] % 10
        }

        print(a.map { String($0) }.joined(separator: ""))
    }
}
