//
//  3009.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/28.
//

import Foundation

class BaekJoon3009 {
    func run() {
        solution()
    }
    
    /// - Note: 문제풀이. 네번째 점
    /// - Important: x좌표, y좌료 정렬 후 가장 적은 숫자를 배열에 추가
    
    func solution() {
        var rectangle: [[Int]] = []
        var result: [Int] = []
        
        for _ in 0..<3 {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            rectangle.append(xy)
        }
        rectangle.sort(by: {$0[0] < $1[0]})
        result.append(rectangle[1][0] != rectangle[0][0] ? rectangle[0][0] : rectangle[2][0])
        
        rectangle.sort(by: {$0[1] < $1[1]})
        result.append(rectangle[1][1] != rectangle[0][1] ? rectangle[0][1] : rectangle[2][1])

        result.forEach{print($0, terminator: " ")}
    }
}
