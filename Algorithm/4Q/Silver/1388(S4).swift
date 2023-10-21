//
//  1388.swift
//  Algorithm
//
//  Created by 지준용 on 10/21/23.
//

import Foundation


final class BaekJoon1388 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let size = readLine()!.split(separator: " ").compactMap { Int($0) }
        let height = size[0], width = size[1]
        var floor = [[String]]()
        var result = 0
        
        for _ in 0..<height {
            let boards = readLine()!.map { String($0) }
            result += boards.split(separator: "|").count
            floor.append(boards)
        }
        
        for i in 0..<width {
            let reversed = floor.map { $0[i] }.joined()
            result += reversed.split(separator: "-").count
        }
        print(result)
    }
    
    private func solution2() {
        let size = readLine()!.split(separator: " ").compactMap { Int($0) }
        let height = size[0], width = size[1]
        var floor = [[String]]()
        
        for _ in 0..<height {
            let woodBoard = readLine()!.map { String($0) }
            floor.append(woodBoard)
        }
        
        var isChecked = Array(repeating: Array(repeating: false, count: width), count: height)
        var result = 0
        
        for row in 0..<height {
            for col in 0..<width {
                if !isChecked[row][col] {
                    dfs(row, col, floor[row][col])
                    result += 1
                }
            }
        }
        
        print(result)
        
        func dfs(_ row: Int, _ col: Int, _ woodType: String) {
            if isChecked[row][col] || floor[row][col] != woodType {
                return
            }
            
            isChecked[row][col] = true
            
            if woodType == "-" && col + 1 < width {
                return dfs(row, col + 1, woodType)
            }
            
            if woodType == "|" && row + 1 < height {
                return dfs(row + 1, col, woodType)
            }
        }
    }
}
