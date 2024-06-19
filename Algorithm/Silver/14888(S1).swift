//
//  14888.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon14888 {
    func run() {
        solution()
    }
    
    enum Operation: Int {
        case plus = 0
        case minus
        case multiple
        case division
    }
    
    // MARK: - 연산자 끼워넣기(완전탐색, DFS)
    private func solution() {
        /*
            n개의 수로 이뤄진 수열
            n-1개의 연산자가 주어짐. (+, -, *, %)
         
            수의 순서는 바뀌지 않음
            연산자 계산 우선순위 무시. 앞에서부터 연산.
            
            n = 수의 개수
            nums = 주어진 수
            operations = 연산자 개수(+, -, *, %)를 담은 배열. 4개. -> 갯수의 합은 n-1.
         */
        
        
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
        let operations = readLine()!.split(separator: " ").compactMap { Int($0) } //[+, -, *, %]
        var maxValue = Int.min
        var minValue = Int.max
        
        func dfs(_ nextIndex: Int, _ current: Int, _ opers: [Int]) {
            if nextIndex == n {
                if maxValue < current {
                    maxValue = current
                }
                if minValue > current {
                    minValue = current
                }
                return
            }
            
            let next = nums[nextIndex]
            
            for i in 0..<opers.count where opers[i] > 0 {
                guard let operation = Operation(rawValue: i) else { continue }
                var opers = opers
                opers[i] -= 1
                
                switch operation {
                case .plus:
                    dfs(nextIndex+1, current + next, opers)
                case .minus:
                    dfs(nextIndex+1, current - next, opers)
                case .multiple:
                    dfs(nextIndex+1, current * next, opers)
                case .division:
                    dfs(nextIndex+1, current / next, opers)
                }
            }
        }
        
        dfs(1, nums[0], operations)
        
        print(maxValue)
        print(minValue)
    }
}
