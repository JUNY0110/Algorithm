//
//  2444.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/26.
//

import Foundation


class BaekJoon2444 {
    func run() {
        solution2()
    }

    /// - Important: 문제풀이, 다이아몬드 별찍기
    /// - Note: 내 풀이. 홀수의 별찍기(입력값 * 2 - i) 및 증감 표현을 위한 Stride, String(repeating) 사용
    
    func solution1() {
        if let input = readLine(),
           let num = Int(input) {
            
            for i in 1...num {
                let n = num - i
                print(String(repeating: " ", count: n), terminator: "")
                print(String(repeating: "*", count: i-1), terminator: "")
                print(String(repeating: "*", count: i))
            }
            for j in 1..<num {
                let n = num - j
                print(String(repeating: " ", count: j), terminator: "")
                print(String(repeating: "*", count: n), terminator: "")
                print(String(repeating: "*", count: n-1))
            }
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        
        for i in stride(from: 1, to: num * 2, by: 2) {
            print(String(repeating: " ", count: (num * 2 - i) / 2), terminator: "")
            print(String(repeating: "*", count: i))
        }
        for j in stride(from: (num - 1) * 2, to: 0, by: -2) {
            print(String(repeating: " ", count: (num * 2 - j) / 2), terminator: "")
            print(String(repeating: "*", count: j - 1))
        }
    }
}
