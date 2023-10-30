//
//  2828.swift
//  Algorithm
//
//  Created by 지준용 on 10/24/23.
//

import Foundation


final class BaekJoon2828 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
        let _ = nm[0], m = nm[1] // n = 스크린 범위, m = 바구니 크기
        let j = Int(readLine()!)! // 사과 갯수
        var basket = [1]
        
        if m > 1 {
            basket.append(m)
        }
        
        var distance = 0
        
        for _ in 0..<j {
            let site = Int(readLine()!)! // 떨어지는 사과 위치
            
            guard let first = basket.first else { continue }
            guard let last = basket.last else { continue }
            
            if first > site {
                for i in 0..<basket.count {
                    basket[i] -= first - site
                }
                
                distance += first - site
            } else if last < site {
                for i in 0..<basket.count {
                    basket[i] += site - last
                }
                
                distance += site - last
            }
        }
        print(distance)
    }
}
