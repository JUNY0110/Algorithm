//
//  11005.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/03.
//

import Foundation

class BaekJoon11005 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 10진수를 다른 진수로 변환하기
    /// - IMPORTANT: String의 radix 기능 활용. 변환 시 소문자로 나타나므로, 대문자 변환 필요
    
    func solution() {
        let input = readLine()!.split(separator: " ").map { String($0) }
        print(String(Int(input[0])!, radix: Int(input[1])!).uppercased())
    }
}
