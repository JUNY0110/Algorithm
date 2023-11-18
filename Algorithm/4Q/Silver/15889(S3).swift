//
//  15889.swift
//  Algorithm
//
//  Created by 지준용 on 11/18/23.
//

import Foundation


final class BaekJoon15889 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)! // 사람 수
        let coordinates = readLine()!.split(separator: " ").compactMap{ Int($0) }
        
        var maxRange = 0
        
        if n > 1 {
            let maxRanges = readLine()!.split(separator: " ").compactMap{ Int($0) }
            
            for i in 0..<n-1 {
                let currentRange = coordinates[i] + maxRanges[i]
                
                if maxRange < currentRange {
                    maxRange = currentRange
                }
                
                if maxRange >= coordinates[i+1] {
                    continue
                }
                return print("엄마 나 전역 늦어질 것 같아")
            }
        }
        return print("권병장님, 중대장님이 찾으십니다")
    }
}
