//
//  4796.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon4796 {
    func run() {
        solution()
    }
    
    // MARK: - 캠핑(그리디)
    private func solution() {
        var caseCount = 1
        
        while true {
            let lpv = readLine()!.split(separator: " ").compactMap { Int($0) }
            let l = lpv[0] // 캠핑장 기간 중, 사용 가능 기간 ( L 일동안만 사용 가능 )
            let p = lpv[1] // 캠핑장 사용 기준 ( 연속하는 P일 중 )
            let v = lpv[2] // 휴가 기간
            
            if (l,p,v) == (0,0,0) { break }
            
            // v/p = 전체 휴가기간 중, 연달아 캠핑가능한 횟수
            // v / p * l = 연달아 캠핑 가능한 날 중, 실제 캠핑 가능한 일수
            // v % p = 남은 날짜 중 캠핑장이 운영하는 날 -> 이 중에서 실제 가능한 날 확인
            
            let fullCamping = v / p * l
            let other = (v % p > l) ? l : v % p
            let result = fullCamping + other
            
            print("Case \(caseCount): \(result)")
            caseCount += 1
        }
    }
}
