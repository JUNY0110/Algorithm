//
//  24467.swift
//  Algorithm
//
//  Created by 지준용 on 6/13/24.
//

import Foundation


final class BaekJoon24467 {
    func run() {
        print(solution())
    }
    
    // MARK: - 혼자하는 윷놀이
    private func solution() -> String {
        // 출발지점에 도착하고 1칸을 더 이동해야 완주.
        // 1 = 윷 앞면, 0 = 윷 뒷면
        // 완주하더라도 10턴을 모두 진행할 때까지 윷을 계속 던진다
            // 단, 50줄을 초과하는 입력은 주어지지 않는다.
            // 마지막 입력은 도, 개, 걸 중 하나로 주어진다.
        
        // 룰 (기본 10회 던지기)
            // 0이 1개 = 도
            // 0이 2개 = 개
            // 0이 3개 = 걸
            // 0이 4개 = 윷 -> 모두 뒷면(0) -> 1번 더
            // 1이 4개 = 모 -> 모두 앞면(1) -> 1번 더
        
        // 꼭지점 방문하지 않았다.
            // 전체를 돌기 때문에 20 초과이면 WIN
            // 20 이하이면 LOSE
        // 꼭지점 방문했다
            // 5에서 방문 -> + 3
                // 중앙 방문 (3)
                    // 4칸 이상 추가되면 종료 -> 12 이상이면 WIN
                // 중앙 미방문
                    // 5 + 6 + 5 + 1 -> 17 이상이면 WIN
            // 10에서 방문 -> + 7이면 끝
        
        var chance = 10 // 던질 수 있는 기회
        var move = 0
        var visitedPoint = 0 // 꼭지점 방문 여부
        var visitedCenter = false
        var result = "LOSE"
        
        while chance > 0 { // 모든 기회를 소진할 때까지 던지기
            chance -= 1
            
            let throwing = readLine()!.compactMap { Int(String($0)) }
            let count = throwing.filter{$0 == 0}.count
            guard let yut = Yut(rawValue: count) else { continue }
            let jump = yut.jump
            
            if yut == .모 || yut == .윷 { // 모, 윷이면 1번 더!
                chance += 1
            }
            
            move += jump
            
            if visitedPoint == 0 && move % 5 == 0 && move < 15 { // 꼭지점에 처음 도착하면
                visitedPoint = move                              // 방문 위치 저장
            }
            
            if visitedPoint == 5 {  // 첫번째 꼭지점에 방문했었으면
                if visitedCenter {  // 중앙 방문했으면
                    if move >= 12 { // 12이상이면 승리
                        result = "WIN"
                    }
                } else {  // 아직 중앙에 방문하지 않았는데
                    if move == 8 {  // 이제 방문했으면
                        visitedCenter = true // 방문확인
                        continue
                    }
                    
                    if move >= 17 {  // 중앙에 방문하지 않았지만, 17칸 넘어가면 승리
                        result = "WIN"
                    }
                }
            }
            
            if visitedPoint == 10 { // 2번째 꼭지점에 방문했었으면
                if move >= 17 {     // 17이상이면 승리
                    result = "WIN"
                }
            }
        }
        
        if move > 20 { result = "WIN" } // 20칸 넘게 이동했으면 승리
        
        return result
    }
    
    enum Yut: Int {
        case 도 = 1 // 뒷면(0)의 갯수
        case 개 = 2
        case 걸 = 3
        case 윷 = 4
        case 모 = 0
        
        var jump: Int {
            switch self {
            case .도:
                return 1
            case .개:
                return 2
            case .걸:
                return 3
            case .윷:
                return 4
            case .모:
                return 5
            }
        }
    }
}
