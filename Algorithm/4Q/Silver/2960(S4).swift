//
//  2960.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/27.
//

import Foundation

class BaekJoon2960 {
    func run() {
        solution()
    }
    
    private func solution() {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = input[0], k = input[1]
        var check = Array(repeating: 0, count: n+1)
        var count = 0
        var result = 0
        
    outLoop: for i in Array(2...n) {
        if check[i] == 0 {
            for j in stride(from: i, through: n, by: i) where check[j] == 0 {
                check[j] = 1
                count += 1
                
                if count == k {
                    result = j
                    break outLoop
                }
            }
        }
    }
        print(result)
    }
}
