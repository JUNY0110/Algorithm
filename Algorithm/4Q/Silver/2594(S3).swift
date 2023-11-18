//
//  2594.swift
//  Algorithm
//
//  Created by 지준용 on 11/18/23.
//

import Foundation


final class BaekJoon2594 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)! // 놀이기구 갯수
        var fullTimes = Array(repeating: true, count: 12 * 60) // 오전 10시 ~ 오후 10시까지(12시간) 이기 떄문.
        
        for _ in 0..<n {
            let schedule = readLine()!.split(separator: " ").compactMap { Int($0) }
            let start = (schedule[0] / 100) * 60 + (schedule[0] % 100) - 600 // 오전 10시 시작을 0시 시작으로 변경하기 위함.
            let end = (schedule[1] / 100) * 60 + (schedule[1] % 100) - 600
            
            for i in (start-10)..<(end+10) {
                if i < 0 || i >= 720 || !fullTimes[i] { // 0시 ~ 12시가 아니거나, 이미 확인한 시간 제외
                    continue
                }
                
                fullTimes[i] = false
            }
        }
        var count = 0
        var result = 0
        
        for i in 0..<fullTimes.count {
            if fullTimes[i] {
                count += 1
                
                if result < count {
                    result = count
                }
                continue
            }
            
            if !fullTimes[i] {
                count = 0
            }
        }
        
        print(result)
    }
}
