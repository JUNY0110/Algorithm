//
//  23278.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation

final class BaekJoon18766 {
    func run() {
        solution()
    }
    
    private func solution() {
        // 카드의 색 = 빨강(R) 노랑(Y) 파랑(B)
        // 숫자 = 0~9
        // 카드 갯수 = n
        // 카드놀이 전 카드
        // 카드놀이 후 카드
        // 바꿔치기 여부를 알아내라
        
        let t = Int(readLine()!)! // 게임 수
        
        for _ in 0..<t {
            _ = readLine()
            let before = readLine()!.split(separator: " ").compactMap { String($0) }.sorted() // 카드놀이 전
            let after = readLine()!.split(separator: " ").compactMap { String($0) }.sorted() // 카드놀이 후
            
            print(before == after ? "NOT CHEATER" : "CHEATER")
        }
    }
}
