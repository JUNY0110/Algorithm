//
//  10655.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/26.
//

import Foundation

class BaekJoon10655 {
    func run() {
        solution1()
    }
    
    // 시간초과
    func solution1() {
        let n = Int(readLine()!)!
        var checkPoint = [(x: Int, y: Int)]()
        var answer = [Int]()
        
        // 전체 체크포인트 저장
        for _ in 1...n {
            let coordinates = readLine()!.split(separator: " ").compactMap { Int($0) }
            let x = coordinates[0]
            let y = coordinates[1]
            
            checkPoint.append((x, y))
        }
        
        var total = [Int]()
        
        for i in 0..<n-1 {
            // a - b 사이 거리
            total.append(abs(checkPoint[i].x - checkPoint[i+1].x) + abs(checkPoint[i].y - checkPoint[i+1].y))
        }
        
        for i in 0..<n-2 {
            // 원래 a-b-c 간의 거리 합
            let origin = abs(total[i] + total[i+1])
            // b를 제외한, a - c의 거리
            let distance = abs(checkPoint[i].x - checkPoint[i+2].x) + abs(checkPoint[i].y - checkPoint[i+2].y)
            answer.append(origin - distance)
        }
        // 전체거리 중, a-c 거리가 가장 먼 것을 제외한 거리.
        print(total.reduce(0, +) - answer.max()!)
    }
}
