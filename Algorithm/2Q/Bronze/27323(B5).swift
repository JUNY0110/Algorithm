//
//  27323.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/28.
//

import Foundation

class BaekJoon27323 {
    func run() {
        solution()
    }
    
    ///- Note: 문제풀이. 직사각형 넓이
    ///- Important: 가로 * 세로 = 직사각형 넓이
    
    func solution() {
        let a = Int(readLine()!)!, b = Int(readLine()!)!
        print(a * b)
    }
}
