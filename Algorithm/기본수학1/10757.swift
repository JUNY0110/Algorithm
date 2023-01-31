//
//  10757.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/31.
//

import Foundation

class BaekJoon10757 {
    func run() {
        solution2()
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
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map{ String($0) }
        let a: [Int] = nums[0].map{ Int(String($0))! }.reversed()
        let b: [Int] = nums[1].map{ Int(String($0))! }.reversed()
        var results = [Int]()
        var onePlus = 0
        var value = 0
        
        for i in 0...max(a.count - 1, b.count - 1) {
            value = (a.count > i ? a[i] : 0) + (b.count > i ? b[i] : 0) + (onePlus)
            if value < 10 {
                results.append(value)
                onePlus = 0
            } else {
                results.append(value % 10)
                onePlus = 1
            }
        }
        if onePlus == 1 {
            value += 1
            results = [value]
//            results.append(1)
        }
        
        print(results.reversed().map{String($0)}.joined(separator: ""))
    }
}
