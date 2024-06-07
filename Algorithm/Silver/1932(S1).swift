//
//  1932.swift
//  Algorithm
//
//  Created by 지준용 on 6/7/24.
//

import Foundation


final class BaekJoon1932 {
    func run() {
        let ns = [5]
        let triangles = [[[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]]]
        let expectedResults = [30]

        
        for i in 0..<ns.count {
            let triangle = triangles[i]
            let expectedResult = expectedResults[i]
            
            let output = solution2(triangle)
            
            if expectedResult == output {
                print("정답입니다. 정답: \(expectedResult), 출력: \(output)")
            } else {
                print("오답입니다. 정답: \(expectedResult), 출력: \(output)")
            }
        }
        
    }
    
    // dfs풀이(시간초과)
    private func solution(_ triangle: [[Int]]) -> Int {
        let n = Int(readLine()!)!
        var floors = Array(repeating: [Int](), count: n)
        
        for i in 0..<floors.count {
            floors[i] = readLine()!.split(separator: " ").compactMap { Int($0) }
        }
        
        let top = floors[0]
        var result = Int.min

        func findSumMax(_ floor: Int, _ sum: Int) {
            if floor >= floors.count-1 {
                if result < sum {
                    result = sum
                }
                return
            }
            
            for i in 0..<floors[floor].count-1 {
                findSumMax(floor+1, sum + floors[floor][i] )
                findSumMax(floor+1, sum + floors[floor][i+1] )
            }
        }
        
        findSumMax(1, top[0])
        
        return result
    }
    
    // DP풀이. 정답
    private func solution2(_ triangle: [[Int]]) -> Int {
        let n = Int(readLine()!)!
        var triangle = Array(repeating: [Int](), count: n)
        
        for i in 0..<n {
            triangle[i] = readLine()!.split(separator: " ").compactMap { Int($0) }
        }
        
        var dp = triangle
        
        for floor in stride(from: triangle.count-2, through: 0, by: -1) { // 아래에서부터 위로 올라가기 위함.
            for j in 0..<triangle[floor].count {
                dp[floor][j] = max(dp[floor+1][j], dp[floor+1][j+1]) + triangle[floor][j]
            }
        }
        
        return dp[0][0]
    }
}
