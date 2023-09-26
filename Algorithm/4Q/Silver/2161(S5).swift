//
//  2161.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon2161 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        var cards = Array(1...number)
        var count = 0
        var result = [String]()
        
        while !cards.isEmpty {
            let card = cards.removeFirst()
            count += 1
            
            if count % 2 == 0 {
                cards.append(card)
                continue
            }
            result.append(String(card))
        }
        print(result.joined(separator: " "))
    }
}
