//
//  15439.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/21.
//

import Foundation

class BaekJoon15439 {
    func run() {
        solution()
    }
    /// - NOTE: 문제풀이. i개 색을 가진 상하의를 색상이 중복되지 않게 입기

    func solution() {
        let n = Int(readLine()!)!
        print(n * n - n)
    }
}
