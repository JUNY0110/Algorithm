//
//  1764.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/17.
//

import Foundation

class BaekJoon1764 {
    func run() {
        solution()
    }
    
    /// - NOTE: 문제풀이. 듣지 못한 사람과 보지 못한 사람. 즉 듣지도 보지도 못한 사람 찾기
    /// - IMPORTANT: 딕셔너리 활용 및 이해.
    
    func solution() {
        let count = readLine()!.split(separator: " ").map { Int($0)! }
        var dictionary = [String: String]()
        var result = [String]()

        for _ in 0..<count[0] {
            let noListen = readLine()!
            
            dictionary[noListen] = noListen
        }
        for _ in 0..<count[1] {
            let noSee = readLine()!
            
            if dictionary.keys.contains(noSee) {
                result.append(noSee)
            }
        }
        
        result.sort()
        
        print(result.count)
        result.forEach {
            print($0)
        }
    }
}
