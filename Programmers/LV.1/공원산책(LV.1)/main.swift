//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/03.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        let park = readLine()!.split(separator: " ").map { String($0) }
        let routes = readLine()!.split(separator: ",").map { String($0) }
        print(solution(park, routes))
    }
    
    // SOO OOO OOO , E 2,S 2,W 1 -> 2 1
    // SOO OXX OOO , E 2,S 2,W 1 -> 0, 1
    // OSO OOO OXO OOO, E 2,S 3,W 1 -> 0, 0 
    
    func solution(_ park:[String], _ routes:[String]) -> [Int] {
        var s = [0, 0]
        var x = [[Int]]()
        // 동서남북 최대,최소값
        let nswe = (north: 0, south: park.count-1, west: 0, east: park[0].count-1)
        
        // 공원 시작위치, 장애물 위치 파악
        checkCoordinates(of: park, &s, &x)
        
        // 로봇강아지 이동
        for i in 0..<routes.count {
            let route = routes[i].split(separator: " ").map { String($0) }
            let direction = route[0]
            guard let distance = Int(route[1]) else { break }
            
            var tempS = s
            
            // 방향별 1칸씩 이동해보기
            for _ in 0..<distance {
                // 이동할 수 있는 거리인지 확인
                switch direction {
                case "N" where (s[0] - distance) >= nswe.north: tempS[0] -= 1
                case "S" where (s[0] + distance) <= nswe.south: tempS[0] += 1
                case "E" where (s[1] + distance) <= nswe.east: tempS[1] += 1
                case "W" where (s[1] - distance) >= nswe.west: tempS[1] -= 1
                default: break
                }
                // 이동 중 장애물을 만나면 초기화
                if x.contains(tempS) {
                    tempS = s
                    break
                }
            }
            // 무사히 이동하면 값 저장
            s = tempS
        }
        
        return s
    }
    
    func checkCoordinates(of park:[String], _ s: inout [Int], _ x: inout [[Int]]){
        for h in 0..<park.count {
            let parkLine = park[h].map { String($0) }
            
            for w in 0..<parkLine.count {
                if parkLine[w] == "S" {
                    s = [h, w]
                }
                if parkLine[w] == "X" {
                    x.append([h, w])
                }
            }
        }
    }
}
