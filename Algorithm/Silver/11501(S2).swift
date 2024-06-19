//
//  11501.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon11501 {
    func run() {
        solution()
    }
    
    // MARK: - 주식(그리디)
    private func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            // 현 위치를 기준으로, 최고점에서 팔면 항상 최대이익.
            // 근데, firstIndex나 max를 사용하면 시간초과가 발생할 것임..
            let n = Int(readLine()!)!
            var stocks = readLine()!.split(separator: " ").compactMap { Int($0) }
            stocks = Array(stocks.reversed())
            var benefits = 0
            var maxPrice = Int.min
            
            for i in 0..<n {
                if maxPrice < stocks[i] {
                    maxPrice = stocks[i]
                    continue
                }
                benefits += maxPrice - stocks[i]
            }
            print(benefits)
        }
    }
}
