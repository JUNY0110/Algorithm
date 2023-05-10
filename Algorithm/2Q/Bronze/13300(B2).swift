//
//  13300.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/10.
//

import Foundation

class BaekJoon13300 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 방 갯수 구하기
    /// - IMPORTANT: 남녀 방 따로, 방별 최대인원수에 맞춰 최소 방 갯수를 구하기.
    
    func solution1() {
        let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
        let n = conditions[0]
        let max = conditions[1]
        var students = [[Int]]()
        var result = 0
        
        for _ in 0..<n {
            let student = readLine()!.split(separator: " ").map { Int(String($0))! }
            students.append(student)
        }
        
        for i in 1...6 {
            let w = students.filter{$0[0] == 0 && $0[1] == i}.count
            let m = students.filter{$0[0] == 1 && $0[1] == i}.count
            
            result += (w / max) + (w % max > 0 ? 1 : 0)
                    + (m / max) + (m % max > 0 ? 1 : 0)
        }

        print(result)
    }
    
    func solution2() {
        let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
        var students = Array(repeating: Array(repeating: 0, count: 6), count: 2)
        var result = 0
        
        for _ in 0..<arr[0] {
            let info = readLine()!.split(separator: " ").map { Int(String($0))! }
            students[info[0]][info[1] - 1] += 1
        }
        
        for w in students[0] {
            result += (w / arr[1]) + (w % arr[1] > 0 ? 1 : 0)
        }
        
        for m in students[1] {
            result += (m / arr[1]) + (m % arr[1] > 0 ? 1 : 0)
        }
        
        print(result)
    }
}
