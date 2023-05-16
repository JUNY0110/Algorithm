//
//  10816.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/16.
//

import Foundation

class BaekJoon10816 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 같은 숫자 카드 갯수 세기
    /// - IMPORTANT: 딕셔너리 키 = 숫자카드, 값 = 숫자갯수. 로 계산.
    
    func solution1() {
        let n = Int(readLine()!)!
        let nCards = readLine()!.split(separator: " ").map { Int($0)! }
        
        let m = Int(readLine()!)!
        let mCards = readLine()!.split(separator: " ").map { Int($0)! }
        
        var dictionary = [Int: Int]()
        var results = [Int]()
        
        for card in nCards {
            if dictionary.keys.contains(card) {
                dictionary[card, default: 0] += 1
            } else {
                dictionary[card] = 1
            }
        }

        for card in mCards {
            results.append(dictionary.keys.contains(card) ? dictionary[card]! : 0)
        }
        
        print(results.map { String($0) }.joined(separator: " "))
    }
    
    func solution2() {
        let _ = Int(readLine()!)!
        let nCards = readLine()!.split(separator: " ").map { Int($0)! }
        
        let _ = Int(readLine()!)!
        let mCards = readLine()!.split(separator: " ").map { Int($0)! }
        
        let dictionary = Dictionary(grouping: nCards) { $0 }
        var results = [Int]()
        
        for card in mCards {
            results.append(dictionary.keys.contains(card) ? dictionary[card]!.count : 0)
        }
        
        print(results.map { String($0) }.joined(separator: " "))
    }
    
}
