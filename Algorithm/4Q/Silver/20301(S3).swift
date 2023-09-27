//
//  20301.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/27.
//

import Foundation

class BaekJoon20301 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = numbers[0], k = numbers[1], m = numbers[2]
        
        var people = Array(1...n)
        var josephus = [Int]()
        var index = 0
        var removalCount = 0
        
        while !people.isEmpty {
            index = (index + k - 1) % people.count
            
            let removal = people.remove(at: index)
            josephus.append(removal)
            
            removalCount += 1
            
            if removalCount % m == 0 {
                people.reverse()
                index = people.count - index
            }
        }
        
        josephus.forEach {
            print($0)
        }
    }
}
