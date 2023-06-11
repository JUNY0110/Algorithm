//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/11.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let N = Int(readLine()!)!
        let stages = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution2(N, stages))
    }

    // MARK: - 오답(시간초과) filter로 인해 이중 for문이 사용되고 있음.
    func solution1(_ N:Int , _ stages:[Int]) -> [Int] {
        var failurePercent = [Int: Double]()
        
        for n in 1...N {
            let challenged = stages.filter { $0 >= n }
            
            if challenged == [] {
                failurePercent[n] = 0
            } else {
                failurePercent[n] = Double(stages.filter { $0 == n }.count) / Double(challenged.count)
            }
        }
        
        let sortedFailurePercent = failurePercent.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        }
        
        print(sortedFailurePercent)

        return sortedFailurePercent.map { $0.key }
    }
    
    // MARK: - 정답
    func solution2(_ N:Int , _ stages:[Int]) -> [Int] {
        var stageUsers = Dictionary(grouping: stages) { $0 }
        var beforeUsers = 0
        var fp = [Int: Double]()
        
        for lv in 1...N {
            let challenging = stageUsers[lv, default: []].count
            // 도전했던 사람들 = 전체 유저 - 현 스테이지 미만의 유저들
            let challenged = stages.count - beforeUsers

            // 실패율 = 도전 중인 사람들 / 도전했던 사람들
            fp[lv] = Double(challenging) / Double(challenged == 0 ? 1 : challenged)
            beforeUsers += challenging
        }
        
        // 기본적으로 실패율 기준 내림차순
        // 실패율이 동률이면, 스테이지 레벨 오름차순
        let result = fp.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        }
        
        return result.map { $0.key }
    }
}
