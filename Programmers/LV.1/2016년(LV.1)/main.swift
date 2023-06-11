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
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        print(solution1(a, b))
    }
    
    enum WeekDays: Int {
        case thu, fri, sat, sun, mon, tue, wed
    }
    
    func solution1(_ a:Int, _ b:Int) -> String {
        var days = 0
        
        for m in 1..<a {
            switch m {
            case 1...7 where m == 2: days += 29
            case 1...7 where m % 2 == 1: days += 31
            case 1...7 where m % 2 == 0: days += 30
            case 8...12 where m % 2 == 1: days += 30
            case 8...12 where m % 2 == 0: days += 31
            default: break
            }
        }
        
        guard let result = WeekDays(rawValue: (days + b) % 7) else { return "" }
        
        switch result {
        case .thu: return "THU"
        case .fri: return "FRI"
        case .sat: return "SAT"
        case .sun: return "SUN"
        case .mon: return "MON"
        case .tue: return "TUE"
        case .wed: return "WED"
        }
    }
    
    
    func solution2(_ a:Int, _ b:Int) -> String {
        let weekDays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
        let monthDays = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let weekIndex = (monthDays[1..<a].reduce(0, +) + b) % 7
        
        return weekDays[weekIndex]
    }
}
