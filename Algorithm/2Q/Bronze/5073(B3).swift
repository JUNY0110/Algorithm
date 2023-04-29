//
//  5073.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/29.
//

import Foundation

class BaekJoon5073 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 삼각형 판단하기
    /// - IMPORTANT: 삼각형이 될 수 없는 예외 조건을 먼저 구하고, 정삼각형, 이등변삼각형, 삼각형 순으로 구해야 한다.
    
    func solution() {
        while let input = readLine()?.split(separator: " ").map ({ Int(String($0))! }).sorted(),
              input[2] != 0 {

            if input[2] >= input[1] + input[0] {
                print("Invalid")
            } else if input[0] == input[2] {
                print("Equilateral")
            } else if input[0] == input[1] || input[1] == input[2] {
                print("Isosceles")
            } else {
                print("Scalene")
            }
        }
    }
}
