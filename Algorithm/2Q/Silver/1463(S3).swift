//
//  1463.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/21.
//

import Foundation

class BaekJoon1463 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 연산횟수 구하기
    /// - IMPORTANT: 연산과정과 횟수 규칙 찾기. 다이나믹 프로그래밍
    
    func solution() {
        let num = Int(readLine()!)!
        var numArr = Array(repeating: 0, count: num+1)
        
        for i in 2..<num+1 {
            numArr[i] = numArr[i-1] + 1
            
            if i % 3 == 0 {
                numArr[i] = min(numArr[i], numArr[i / 3] + 1)
            }
            if i % 2 == 0 {
                numArr[i] = min(numArr[i], numArr[i / 2] + 1)
            }
        }
        print(numArr[num])
    }
}


/*
 1 -> 0
 2 -> 1
 3 -> 1
 
 4 -> 2
 5 -> 3
 6 -> 2
 7 -> 3
 8 -> 3
 9 -> 2
 10 -> 3
 */
