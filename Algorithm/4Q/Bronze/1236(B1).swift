//
//  1236.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation


final class BaekJoon1236 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let row = numbers[0], column = numbers[1]
        var matrix = [[Bool]]()
        var rowCount = 0, columnCount = 0
        
        for _ in 0..<numbers[0] {
            let row = readLine()!.map { $0 == "." ? true : false }
            matrix.append(row)
        }
        
        for i in 0..<row {
            if matrix[i].contains(false) { continue }
            rowCount += 1
        }
        
        for j in 0..<column {
            if matrix.map ({ $0[j] }).contains(false) { continue }
            columnCount += 1
        }
        
        print([rowCount, columnCount].max() ?? 0)
    }
}
