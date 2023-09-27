//
//  1158.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/27.
//

import Foundation

class BaekJoon1158 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        var people = Array(1...numbers[0])
        var idx = 0
        var josephus = [String]()
        
        while !people.isEmpty {
            idx = (idx + numbers[1] - 1) % people.count
            josephus.append(String(people.remove(at: idx)))
        }
        print("<\(josephus.joined(separator: ", "))>")
    }
}
