//
//  14425.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/14.
//

import Foundation

class BaekJoon14425 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 두 집합의 같은 문자열 갯수 확인하기
    /// - IMPORTANT:Set.contains는 O(1) 시간복잡도를 가짐.
    
    func solution1() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        var s = Set<String>()
        var arr = [String]()
        var count = 0
        
        for _ in 0..<nm[0] {
            let input = readLine()!
            s.insert(input)
        }
        
        for _ in 0..<nm[1] {
            let input = readLine()!
            arr.append(input)
        }
        
        for element in arr {
            count += s.contains(element) ? 1 : 0
        }
        print(count)
    }
    
    func solution2() {
        let count = readLine()!.split(separator: " ").map { Int($0)! }
        var s = Set<String>()
        var result = 0
        
        for _ in 0..<count[0] {
            let input = readLine()!
            s.insert(input)
        }
        
        for _ in 0..<count[1] {
            result += s.contains(readLine()!) ? 1 : 0
        }
        print(result)
    }
}
