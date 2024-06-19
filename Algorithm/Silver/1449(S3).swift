//
//  1449.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation



final class BaekJoon1449 {
    func run() {
        solution()
    }
    
    // MARK: - 수리공 항승(그리디)
    private func solution() {
        /*
            목표: 물이 새는 곳을 테이프로 막아 수리할 때, 필요한 테이프의 최소 개수는?
            테이프를 붙일 때, 물이 새는 곳에서 좌우 0.5의 간격을 두고 붙여야 한다.
            즉 1의 간격 차이가 있음.
         */
        
        
        let nl = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nl[0] // 물이 새는 곳의 개수
        let l = nl[1] // 테이프 길이
        
        let leaks = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted() // 물이 새는 곳 위치
        
        var last = leaks[0]+l-1 // 처음 발생한 누수지점 ~ 테이프가 붙은 끝지점, 좌우 간격 0.5(즉, 1)
        var result = 1
        
        for i in 0..<n {
            if last < leaks[i] {
                result += 1
                last = leaks[i]+l-1
            }
        }
        
        print(result)
    }
}
