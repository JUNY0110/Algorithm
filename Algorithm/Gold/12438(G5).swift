//
//  12438.swift
//  Algorithm
//
//  Created by 지준용 on 7/3/24.
//

import Foundation


final class BaekJoon12438 {
    func run() {
        solution()
    }
    
    // MARK: - 새로운 달력 (Large)(수학)
    private func solution() {
        let t = Int(readLine()!)!
        
        for i in 0..<t {
            var space = 0
            let standards = readLine()!.split(separator: " ").compactMap { Int($0) } // 달력 기준이 되는 값들.
            var months = standards[0] // 총 월수
            let days = standards[1]   // 월당 일수
            let weeks = standards[2]  // 주당 일수

            let lcm = findLCM(days, weeks)  // 반복 주기 일수
            var minCal = lcm / days         // 반복 주기 월수
            var extraCal = months % minCal  // 나머지 월수

            var lines = 0
            
            // 최소 반복연산보다 월수가 적은 경우
            if minCal > months {
                while months > 0 {
                    lines += (days + space) / weeks
                    space = (days + space) % weeks
                    
                    if space != 0 {
                        lines += 1
                    }
                    months -= 1
                }
            } else {
                let count = months / minCal
                
                while minCal > 0 {
                    lines += (days + space) / weeks
                    space = (days + space) % weeks
                    
                    if space != 0 {
                        lines += 1
                    }
                    minCal -= 1
                }
                
                lines = lines * count
                
                while extraCal > 0 {
                    lines += (days + space) / weeks
                    space = (days + space) % weeks
                    
                    if space != 0 {
                        lines += 1
                    }
                    extraCal -= 1
                }
            }
            
            print("Case #\(i+1): \(lines)")
        }
        
        func findGCD(_ num1: Int, _ num2: Int) -> Int {
            if num2 == 0 {
                return num1
            }
            return findGCD(num2, num1 % num2)
        }
        
        func findLCM(_ num1: Int, _ num2: Int) -> Int { //최소공배수 찾기
            return num1 * num2 / findGCD(num1, num2)
        }
    }
}
