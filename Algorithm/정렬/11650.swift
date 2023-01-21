//
//  11650.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon11650 {
    func run() {
        solution3()
    }
    // MARK: - Array사용(메모리 높음. 시간 상대적 높음)
    func solution1() {
        let num = Int(readLine()!)!
        var nums = Array<[Int]>()
        
        for _ in 0..<num {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            nums.append(xy)
        }
        nums.sort(by: {$0[1] < $1[1]})
        nums.sort(by: {$0[0] < $1[0]})
        
        nums.forEach {
            print($0[0], $0[1])
        }
    }
    
    func solution2() {
        var nums = Array<[Int]>()

        for _ in 0..<Int(readLine()!)! {
            nums.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        nums.sort(by: {$0[1] < $1[1]})
        nums.sort(by: {$0[0] < $1[0]})

        print(nums.map{ "\($0[0]) \($0[1])" }.joined(separator: "\n"))
    }
    
    func solution3() {
        var nums = Array<[Int]>()

        for _ in 0..<Int(readLine()!)! {
            nums.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        nums.sort(by: {$0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]})

        print(nums.map{ "\($0[0]) \($0[1])" }.joined(separator: "\n"))
    }
    
    
    // MARK: - Tuple사용(메모리 낮음. 시간 짧음)
    func solution4() {
        var numTuples = [(x: Int, y: Int)]()

        for _ in 0..<Int(readLine()!)! {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            numTuples.append((xy[0], xy[1]))
        }

        numTuples.sort(by: {($0.x == $1.x) ? ($0.y < $1.y) : ($0.x < $1.x)})
        print(numTuples.map{ "\($0.x) \($0.y)" }.joined(separator: "\n"))
    }
}
