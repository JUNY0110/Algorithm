//
//  5585.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon5585 {
    func run() {
        solution()
    }
    
    // MARK: - 거스름돈(그리디)
    // 1000엔을 냈을 때, 받는 거스름돈의 갯수는?
    private func solution() {
        var change = 1000 - Int(readLine()!)!
        let yens = [500, 100, 50, 10, 5, 1] // 엔화 단위
        var result = 0
        
        for yen in yens {
            result += change / yen
            change %= yen
        }
        print(result)
    }
}
