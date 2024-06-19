//
//  2217.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation



final class BaekJoon2217 {
    func run() {
        solution()
    }
    
    /* 
     이 문제가 그리디인 이유:
        전체 로프가 만약 3개 존재하며
        각 로프가 100, 99, 49의 장력을 가진다고 할 때.
     
        100 하나이면 100
        100, 99이면 198
        100 99 49이면 147의 최대 장력을 가짐
     
        로프의 갯수가 많다고 좋은 게 아니며
        견딜 수 있는 하중이 제한적인 로프를 선별해 들 수 있는 최대한 무거운 무게를 찾는 문제이기 때문.
     */
    
    // MARK: - 로프(그리디)
    private func solution() {
        let n = Int(readLine()!)! // 로프 갯수 -> 하지만 모든 로프를 사용할 필요는 없다.
        var ropes = [Int]()
        
        for _ in 0..<n {
            let rope = Int(readLine()!)! // 로프가 들 수 있는 최대 중량
            ropes.append(rope)
        }
        
        ropes.sort(by: >)
        
        var result = 0
        
        for i in 0..<n {
            result = max(result, ropes[i] * (i+1))
        }
        print(result)
    }
}
