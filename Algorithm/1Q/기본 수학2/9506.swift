//
//  9506.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/22.
//

import Foundation

class BaekJoon9506 {
    func run() {
        solution()
    }
    
    func solution() {
        while let num = Int(readLine()!), num != -1 {
            var arr = [Int]()
            
            for i in 1...num/2 {
                if num % i == 0 {
                    arr.append(i)
                }
            }
            
            if arr.reduce(0, +) == num {
                print("\(num) = \(arr.map{"\($0)"}.joined(separator: " + "))")
            } else {
                print("\(num) is NOT perfect.")
            }
        }
    }
}
