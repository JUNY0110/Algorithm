//
//  2530.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon2530 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let time = readLine()!.split(separator: " ").map { Int(String($0))! }
        var hour = time[0]
        var minute = time[1]
        var second = time[2]

        let cookingTime = Int(readLine()!)!
        
        if second + cookingTime >= 60 {
            second = (time[2] + cookingTime) % 60
            minute = (time[1] + (time[2] + cookingTime) / 60) % 60
            hour = time[0] + (time[1] + (time[2] + cookingTime) / 60) / 60
            while hour >= 24 { hour -= 24 }
        } else {
            second = (time[2] + cookingTime)
        }
        print(hour, minute, second)
    }
    
    func solution2() {
        let time = readLine()!.split(separator: " ").map { Int(String($0))! }
        var hour = time[0]
        var minute = time[1]
        var second = time[2]

        let cookingTime = Int(readLine()!)!
        
        if second + cookingTime >= 60 {
            second = (time[2] + cookingTime) % 60
            minute = (time[1] + (time[2] + cookingTime) / 60) % 60
            hour = (time[0] + (time[1] + (time[2] + cookingTime) / 60) / 60) % 24
        } else {
            second = (time[2] + cookingTime)
        }
        print(hour, minute, second)
    }
}
