//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/24.
//

import Foundation

class Main {
    func solution(_ arr:[[Int]]) -> [[Int]] {
        var arr = arr
        let rowCnt = arr.count
        let columnCnt = arr[0].count
        
        if rowCnt > columnCnt {
            for i in 0..<(rowCnt - columnCnt) {
                for j in 0..<arr.count {
                    arr[j].append(0)
                }
            }
        }
        
        if rowCnt < columnCnt {
            for i in 0..<(columnCnt-rowCnt) {
                arr.append(Array(repeating: 0, count: columnCnt))
            }
        }
        
        return arr
    }
}
