//
//  14215.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/29.
//

import Foundation

class BaekJoon14215 {
    func run() {
        solution()
    }
    
    /// - NOTE:문제풀이. 가장 둘레가 긴 삼각형 만들기
    /// - IMPORTANT: 가장 긴 변이 두 변의 길이의 합보다 작아야 한다.
    
    func solution() {
        var lines = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        
        if lines[2] >= lines[0] + lines[1] {
            lines[2] = lines[0] + lines[1] - 1
        }
        print(lines.reduce(0, +))
    }
}
