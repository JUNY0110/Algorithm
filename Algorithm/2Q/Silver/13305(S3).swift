//
//  13305.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/13.
//

import Foundation

class BaekJoon13305 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 최소 주유비 구하기
    /// - IMPORTANT: 다음 주유소와의 가격 비교하고, 최소가격 * 거리 계산
    
    // n개의 도시가 일직선 도로 위에 있음
    // 도로 1키로당 1리터의 기름 사용
    // 도시당 하나의 주유소.
    // 주유소마다 리터당 가격이 다름
    // 원 = 리터당 가격
    // 도로의 숫자 = 도로의 길이
    // 가장 오른쪽 도시까지 최소비용으로 가기
    
    // n = 4
    // 도로길이 =      2,   3,   1
    // 리터당 가격 = 5 -- 2 -- 4 -- 1
    
    // 앞 도시의 리터가 뒤 도시의 리터보다 비싸면, 최소한만 구매
    // 뒤 도시가 앞 도시보다 비싸면, 다음 도시와 비교해서 다음도시도 비싸면 싼 곳이 나올때까지 인덱스를 돌림
    
    func solution1() {
        let n = Int(readLine()!)!
        let length = readLine()!.split(separator: " ").map { Int($0)! }
        let won = readLine()!.split(separator: " ").map { Int($0)! }
        var low = 0, result = 0

        for i in 0..<n - 1 {
            // 조건1 현 최저값 주유소가 다음 주유소보다 비싸거나 같으면, 다음 주유소 가격을 저장하고, 계산
            if won[low] >= won[i+1] {
                result += won[low] * length[i]
                low = i+1
            } else if won[low] < won[i+1] {
                result += won[low] * length[i]
            }
        }
        
        print(result)
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        let length = readLine()!.split(separator: " ").map { Int($0)! }
        let won = readLine()!.split(separator: " ").map { Int($0)! }
        var low = won[0]
        var result = 0
        
        for i in 0..<n-1 {
            low = min(low, won[i])
            result += low * length[i]
        }
        print(result)
    }
}
