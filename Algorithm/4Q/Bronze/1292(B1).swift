//
//  1292.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon1292 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let start = numbers[0]-1
        let end = numbers[1]-1
        var sequence = [Int]()
        var number = 1

        while sequence.count < numbers[1] {
            sequence += Array(repeating: number, count: number)
            number += 1
        }
        print(sequence[start...end].reduce(0, +))
    }
}
