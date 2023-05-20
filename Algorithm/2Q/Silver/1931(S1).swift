//
//  1931.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon1931 {
    func run() {
        solution3(n: Int(readLine()!)!)
    }
    
    func solution1(n: Int) {
        var timeArr = [(Int, Int)]()
        var now = -1
        var result = 0
        
        for _ in 0..<n {
            let time = readLine()!.split(separator: " ").map { Int($0)! }
            timeArr.append((time[0], time[1]))
        }
        
        timeArr.sort { (a: (Int, Int), b: (Int, Int)) -> Bool in
            if a.1 == b.1 {
                return a.0 < b.0
            } else {
                return a.1 < b.1
            }
        }
        
        for time in timeArr {
            if time.0 >= now {
                now = time.1
                result += 1
            }
        }
        print(result)
    }
    
    func solution2(n: Int) {
        var timeArr = [[Int]]()
        var now = -1
        var result = 0
        
        for _ in 0..<n {
            let time = readLine()!.split(separator: " ").map { Int($0)! }
            timeArr.append(time)
        }
        
        timeArr.sort { (a: [Int], b: [Int]) -> Bool in
            if a[1] == b[1] {
                return a[0] < b[0]
            } else {
                return a[1] < b[1]
            }
        }
        
        for time in timeArr {
            if time[0] >= now {
                now = time[1]
                result += 1
            }
        }
        print(result)
    }
    
    func solution3(n: Int) {
        var timeArr = [[Int]]()
        var result = 0
        
        for _ in 0..<n {
            let time = readLine()!.split(separator: " ").map { Int($0)! }
            timeArr.append(time)
        }
        
        timeArr.sort { (a: [Int], b: [Int]) -> Bool in
            if a[1] == b[1] {
                return a[0] < b[0]
            } else {
                return a[1] < b[1]
            }
        }
        
        var temp = 0
        
        for i in 0..<timeArr.count {
            if temp <= timeArr[i][0] {
                result += 1
                temp = timeArr[i][1]
            }
        }
        print(result)
    }
    
    func solution4(n: Int) {
        var timeArr = [(Int, Int)]()
        var result = 0
        
        for _ in 0..<n {
            let time = readLine()!.split(separator: " ").map { Int($0)! }
            timeArr.append((time[0], time[1]))
        }
        
        timeArr.sort { (a: (Int, Int), b: (Int, Int)) -> Bool in
            if a.1 == b.1 {
                return a.0 < b.0
            } else {
                return a.1 < b.1
            }
        }
        
        var temp = 0
        
        for i in 0..<timeArr.count {
            if temp <= timeArr[i].0 {
                result += 1
                temp = timeArr[i].1
            }
        }
        print(result)
    }
}
