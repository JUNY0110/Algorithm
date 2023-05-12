//
//  1541.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/11.
//

import Foundation

class BaekJoon1541 {
    func run() {
        solution(expression: readLine()!)
    }
    
    /// - NOTE:문제풀이. 괄호를 넣어 최소 계산식 만들기
    /// - IMPORTANT: "-"를 기준으로 입력값을 분리하고, 1번 배열부터 -로 계산. 0번 배열만 있으면 양수
    
    func solution(expression: String) {
        let expression = expression.split(separator: "-").map{ String($0) }
        var result = 0

        for i in 0..<expression.count {
            let sum = expression[i].split(separator: "+").map { Int(String($0))! }.reduce(0,+)
            
            if i > 0 {
                result -= sum
            } else {
                result += sum
            }
        }
        print(result)
    }
    
    func solution2() {
        let expression = readLine()!.split(separator: "-").map{ String($0) }
        var result = 0

        for i in 0..<expression.count {
            let sum = expression[i].split(separator: "+").map { Int(String($0))! }.reduce(0,+)
            
            i > 0 ? (result -= sum) : (result += sum)
        }
        print(result)
    }
}
