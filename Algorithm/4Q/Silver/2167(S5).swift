//
//  2167.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/05.
//

import Foundation


final class BaekJoon2167 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nm[0]
        var array = [[Int]]()
        
        for _ in 0..<n {
            let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
            array.append(numbers)
        }
        
        let k = Int(readLine()!)!
        var result = [Int]()
        
        for _ in 0..<k {
            let point = readLine()!.split(separator: " ").compactMap { Int($0) }
            let i = point[0]-1, j = point[1]-1, x = point[2]-1, y = point[3]-1

            var sum = 0
            
            for index in i...x {
                sum += array[index][j...y].reduce(0, +)
            }
            result.append(sum)
        }
        
        result.forEach {
            print($0)
        }
    }
    
    private func solution2() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nm[0], m = nm[1]
        var array = [[Int]]()
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

        for i in 1...n {
            let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
            array.append(numbers)
            
            for j in 1...m {
                dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + array[i-1][j-1]
            }
        }
        
        let k = Int(readLine()!)!
        
        for _ in 0..<k {
            let point = readLine()!.split(separator: " ").compactMap { Int($0) }
            let i = point[0], j = point[1], x = point[2], y = point[3]
            
            print(dp[x][y] - dp[i-1][y] - dp[x][j-1] + dp[i-1][j-1])
        }
    }
}
