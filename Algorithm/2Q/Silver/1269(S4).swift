//
//  1269.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon1269 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 대칭 차집합
    /// - IMPORTANT: A-B의 원소 집합과, B-A의 원소집합의 원소갯수 합산. (교집합이 아닌 A, B를 구하기)
    /// -- Set 차 구하기(Subtracting), Set 대칭차 구하기(symmetricDifference)
    
    func solution1() {
        let count = readLine()!.split(separator: " ").map { Int($0)! }
        let a = readLine()!.split(separator: " ").map { Int($0)! }
        let b = readLine()!.split(separator: " ").map { Int($0)! }
        
        print(Set(a).subtracting(Set(b)).count + Set(b).subtracting(Set(a)).count)
    }
    
    func solution2() {
        let count = readLine()!.split(separator: " ").map { Int($0)! }
        let a = Set(readLine()!.split(separator: " ").map { Int($0)! })
        let b = Set(readLine()!.split(separator: " ").map { Int($0)! })
        
        print(a.symmetricDifference(b).count)
    }
}
