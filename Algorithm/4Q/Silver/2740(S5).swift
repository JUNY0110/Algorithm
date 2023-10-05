//
//  2740.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/05.
//

import Foundation


final class BaekJoon2740 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nm[0], m = nm[1]
        var firstMatrix = [[Int]]()
        var secondMatrix = [[Int]]()
        
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").compactMap { Int($0) }
            firstMatrix.append(row)
        }
        
        let mk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let k = mk[1]

        for _ in 0..<m {
            let row = readLine()!.split(separator: " ").compactMap { Int($0) }
            secondMatrix.append(row)
        }
        
        for i in 0..<n {
            var result = [Int]()
            
            for j in 0..<k {
                var sum = 0
                
                for l in 0..<m {
                    sum += firstMatrix[i][l] * secondMatrix[l][j]
                }
                result.append(sum)
            }
            print(result.map{String($0)}.joined(separator: " "))
        }
    }
}
