//
//  10813.swift
//  Algorithm
//
//  Created by 지준용 on 2023/03/02.
//

import Foundation

class BaekJoon10813 {
    func run() { solution2() }

    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var balls = Array<Int>(1...nums[0])

        for _ in 0..<nums[1] {
            let ij = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
            balls.insert(balls[ij[1]-1], at: ij[0]-1)
            balls.insert(balls[ij[0]], at: ij[1])
            balls.remove(at: ij[0])
            balls.remove(at: ij[1])
        }
        print(balls.map{"\($0)"}.joined(separator: " "))
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var balls = Array<Int>(1...nums[0])

        for _ in 0..<nums[1] {
            let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
            balls.swapAt(ij[0]-1, ij[1]-1)
        }
        print(balls.map{"\($0)"}.joined(separator: " "))
    }
}
