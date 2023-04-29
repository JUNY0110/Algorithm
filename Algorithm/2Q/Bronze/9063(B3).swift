//
//  9063.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/29.
//

import Foundation

class BaekJoon9063 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 땅 속에 묻힌 옥구슬로 땅 최소 넓이 구하기
    /// - IMPORTANT: (x좌표 최대값 - 최소값) * (y좌표 최대값 - 최소값)
    
    func solution1() {
        let num = Int(readLine()!)!
        var points = [[Int]]()
        
        for _ in 0..<num {
            let point = readLine()!.split(separator: " ").map { Int(String($0))! }
            points.append(point)
        }
        
        points.sort(by: {$0[0] < $1[0]})
        
        if points.count <= 1 {
            print(0)
        } else {
            let width = points.last![0] - points[0][0]
            points.sort(by: {$0[1] < $1[1]})
            let height = points.last![1] - points[0][1]
            print(width * height)
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        var points = [[Int]]()
        
        for _ in 0..<num {
            let point = readLine()!.split(separator: " ").map { Int(String($0))! }
            points.append(point)
        }
        
        let width = points.map{$0[0]}.max()! - points.map{$0[0]}.min()!
        let height = points.map{$0[1]}.max()! - points.map{$0[1]}.min()!
        
        print(width * height)
    }
}
