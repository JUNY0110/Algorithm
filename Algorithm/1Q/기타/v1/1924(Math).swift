//
//  1924.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/17.
//

import Foundation

class BaekJoon1924 {
    func run() { solution2() }
    
    func solution1() {
        let calendar = readLine()!.split(separator: " ").map { Int(String($0))! }
        var sum = 0
        let results = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        
        for i in 1..<calendar[0] {
            if i <= 7 {
                if i == 2 { sum += 28 }
                else if i % 2 == 1 { sum += 31 }
                else { sum += 30 }
            } else {
                if i % 2 == 0 { sum += 31 }
                else { sum += 30 }
            }
        }
        print(results[(sum + calendar[1]) % 7])
    }
    
    func solution2() {
        let calendar = readLine()!.split(separator: " ").map { Int(String($0))! }
        var sum = 0
        let results = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let lastDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        
        for i in 1..<calendar[0] { sum += lastDays[i-1] }
        print(results[(sum + calendar[1]) % 7])
    }
}
