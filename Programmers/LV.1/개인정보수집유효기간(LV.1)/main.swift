//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/29.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let today = readLine()!
        let terms = readLine()!.split(separator: " ").map { String($0) }
        let privacies = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(today, terms, privacies))
    }
    
    func solution1(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
        let expired = expiredPeriods1(of: terms) // 약관에 따른 유효기간
        let dates = calculateExpired1(privacies, expired)
        var result = [Int]()
        
        // 현재 날짜와 유효기간 비교
        for i in 0..<dates.count {
            let (exYear, exMonth, exDay) = (dates[i][0], dates[i][1], dates[i][2]) // 파기일
            let ymd = today.split(separator: ".").compactMap { Int($0) }
            let (year, month, day) = (ymd[0], ymd[1], ymd[2]) // 현재 날짜
            
            if year > exYear
            || year == exYear && month > exMonth
            || year == exYear && month == exMonth && day > exDay { // 파기일보다 현재 날짜가 크면 인덱스 저장.
                result.append(i+1)
            }
        }

        return result.sorted()
    }

    func expiredPeriods1(of terms: [String]) -> [String: Int] {
        var expired = [String: Int]() // 약관에 따른 유효기간
        
        // 약관에 따른 유효기간 저장
        for term in terms {
            let tp = term.split(separator: " ").map { String($0) }
            let type = tp[0]
            let period = Int(tp[1])!
            
            expired[type, default: 0] = period
        }
        
        return expired
    }

    func calculateExpired1(_ privacies: [String], _ expired: [String: Int]) -> [[Int]] {
        var dates = [[Int]]()
        
        for privacy in privacies {
            let dt = privacy.split(separator: " ").map { String($0) }
            let date = dt[0].split(separator: ".").compactMap { Int($0) }
            let type = dt[1]
            
            var (year, month, day) = (date[0], date[1], date[2])
            
            month += expired[type]!
                    
            if day == 1 { // day가 1일이면, 마감일은 이전 달, 마지막 날임.
                month -= 1
                day = 28
            } else {
                day -= 1
            }
            
            if month > 12 {
                year += month / 12
                month %= 12
            }
            
            if month == 0 { // month가 12의 배수 또는 1월이었으면 전년도 12월이 되어야 함.
                year -= 1
                month = 12
            }
            
            dates.append([year, month, day])
        }
        return dates
    }
    
    // ============================================================
    
    func solution2(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
        let expired = expiredPeriods2(of: terms) // 약관에 따른 유효기간
        let dates = calculateExpired2(privacies, expired)
        var result = [Int]()
        
        // 현재 날짜와 유효기간 비교
        for i in 0..<dates.count {
            let ymd = today.split(separator: ".").compactMap { Int($0) }
            let (year, month, day) = (ymd[0] * 12 * 28, ymd[1] * 28, ymd[2]) // 현재 날짜
            let days = year + month + day
            
            if days >= dates[i] { // 파기일보다 현재 날짜가 크면 인덱스 저장.
                result.append(i+1)
            }
        }

        return result
    }

    func expiredPeriods2(of terms: [String]) -> [String: Int] {
        var expired = [String: Int]() // 약관에 따른 유효기간
        
        // 약관에 따른 유효기간 저장
        for term in terms {
            let tp = term.split(separator: " ").map { String($0) }
            let type = tp[0]
            let period = Int(tp[1])!
            
            expired[type, default: 0] = period * 28
        }
        
        return expired
    }

    func calculateExpired2(_ privacies: [String], _ expired: [String: Int]) -> [Int] {
        var dates = [Int]()
        
        for privacy in privacies {
            let dt = privacy.split(separator: " ").map { String($0) }
            let date = dt[0].split(separator: ".").compactMap { Int($0) }
            let type = dt[1]
            
            let (year, month, day) = (date[0] * 12 * 28, date[1] * 28, date[2])

            dates.append(year + month + day + expired[type]!)
        }
        return dates
    }
}
