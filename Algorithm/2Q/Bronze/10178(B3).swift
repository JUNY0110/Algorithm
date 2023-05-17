//
//  10178.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon10178 {
    func run() {
        solution()
    }
    /// - NOTE: 문제풀이. 사탕나눠주고 남은 사탕 구하기
    /// - IMPORTANT: 문자열 보간법(String Interpolation)과 나누기( / ), 모듈러( % ) 연산만 알면 되는 문제.
    
    func solution() {
        let num = Int(readLine()!)!
        
        for _ in 0..<num {
            let candy = readLine()!.split(separator: " ").map{ Int($0)! }
            print("You get \(candy[0] / candy[1]) piece(s) and your dad gets \(candy[0] % candy[1]) piece(s).")
        }
    }
}
