//
//  3985.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/03.
//

import Foundation


final class BaekJoon3985 {
    func run() {
        solution()
    }
    
    private func solution() {
        var l = Array(repeating: 0, count: Int(readLine()!)! + 1) // 롤케익 길이
        let n = Int(readLine()!)! // 방청객 수
        var max = 0, visitor = 0
        
        for i in 1...n {
            let pk = readLine()!.split(separator: " ").compactMap { Int($0) }
            let p = pk[0]
            let k = pk[1]
            
            if max < k - p {
                max = k - p
                visitor = i
            }
            
            for j in p...k where l[j] == 0 {
                l[j] = i
            }
        }
        
        print(visitor) // 가장 많이 받을 것으로 기대하는 방청객 번호
        
        l.removeAll { $0 == 0 }
        
        let visitors = Dictionary(grouping: l){$0}.sorted(by: {$0.key < $1.key})
        max = 0 // 예상 케익 -> 실제 케익
        visitor = 0 // 기대 방청객 번호 -> 실제 방청객 번호
        
        for (number, value) in visitors {
            if max < value.count {
                max = value.count
                visitor = number
            }
        }
        print(visitor) // 실제 가장 많이 받는 방청객 번호
    }
}
