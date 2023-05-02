//
//  2903.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/02.
//

import Foundation

class BaekJoon2903 {
    func run() {
        solution3()
    }
    
    /// - NOTE: 문제풀이. 점의 갯수 구하기
    /// - IMPORTANT: 한 변의 점의 갯수가 2, 3, 5, 9, 17, 33으로 등비수열을 이루며, 이를 제곱해야 함.
    
    func solution1() {
        let num = Int(readLine()!)!
        let square = Int(pow(Double(2), Double(num-1)))

        print(num == 0 ? 4 : Int(pow(Double(3 + (2 * (square - 1))), 2)))
    }
    
    func solution2() {
        var num = Int(readLine()!)!
        var x = 2
        
        while num > 0 {
            x += Int(pow(2, Double(num-1)))
            num -= 1
        }
        print(x * x)
    }
    
    func solution3() {
        if let input = readLine(),
           let n = Int(input) {
            print(pow(pow(2, n) + 1, 2))
        }
    }
}
