//
//  2745.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/28.
//

import Foundation

class BaekJoon2745 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. B진수를 10진수로 변환하기
    /// - IMPORTANT: 36개의 숫자 및 알파벳을 인덱스와 비교해 결과값 도출, Int 기본 기능 중 10진수로 변환하는 기능
    
    func solution1() {
        let nb = readLine()!.split(separator: " ").map { String($0) }
        let n = nb[0].map{String($0)}.reversed()
        let b = nb[1]
        let array = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var count = 0.0
        var result = 0
        
        n.forEach {
            for (index, value) in array.enumerated() {
                if String($0) == value {
                    result += index * Int(pow(Double(b)!, count))
                    count += 1
                }
            }
        }
        print(result)
    }
    
    func solution2() {
        let input = readLine()!.split(separator: " ")
        print(Int(input[0], radix: Int(input[1])!)!)
    }
}
