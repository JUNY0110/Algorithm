//
//  10811.swift
//  Algorithm
//
//  Created by 지준용 on 2023/03/09.
//

import Foundation

class BaekJoon10811 {
    func run() {
        solution()
    }
    /*
     1 2 3 4 5
     2 1 3 4 5
     2 1 4 3 5
     3 4 1 2 5
     */
    func solution() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var array = Array<Int>(1...nums[0])
        
        for _ in 0..<nums[1] {
            let ij = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
            let (i,j) = (ij[0], ij[1])
            array[i...j].reverse()
        }
        print(array.map{"\($0)"}.joined(separator: " "))
    }
}
