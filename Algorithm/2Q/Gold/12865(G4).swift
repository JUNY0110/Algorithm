//
//  12865.swift
//  Algorithm
//
//  Created by 지준용 on 2023/06/08.
//

import Foundation

class BaekJoon12865 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (n, k) = (nk[0], nk[1])

        var items = [(w: Int, v: Int)]()
        
        for _ in 0..<n {
            let wv = readLine()!.split(separator: " ").compactMap { Int($0) }
            let (w, v) = (wv[0], wv[1])

            items.append((w, v))
        }

        var dp = Array(repeating: 0, count: k+1)

        for i in 0..<n {
            for j in stride(from: k, to: 0,  by: -1) {
                if j >= items[i].w {
                    dp[j] = max(dp[j], dp[j-items[i].w] + items[i].v)
                }
            }
        }
        print(dp)
        print(dp[nk[1]])
    }
    
    func solution2() {
        let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (n, k) = (nk[0], nk[1])
        
        var items = [(w: Int, v: Int)]()
        // n = 물품 갯수
        // k = 최대 무게
        // w = 각 물건의 무게
        // v = 각 물건의 가치
        
        for _ in 0..<n {
            let wv = readLine()!.split(separator: " ").compactMap { Int($0) }
            items.append((wv[0], wv[1]))
        }
        
        // 물건을 추가할 때마다 담기는 무게별 최대 가치
        var maxValues = Array(repeating: 0, count: k+1)

        for i in 0..<n {
            for j in stride(from: k, to: 0, by: -1) {
                if j >= items[i].w {
                    // 기록된 무게별 최대가치와 현재 계산한 물건 가치의 합 비교
                    maxValues[j] = max(maxValues[j], items[i].v + maxValues[j-items[i].w])
                }
            }
        }

        print(maxValues.last!)
    }
}
