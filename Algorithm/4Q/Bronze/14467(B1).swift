//
//  14467.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/02.
//

import Foundation


final class BaekJoon14467 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var cows = [Int: Int]()
        var result = 0

        for _ in 0..<n {
            let observaion = readLine()!.split(separator: " ").compactMap { Int($0) }
            let number = observaion[0]
            let move = observaion[1]
            
            if cows[number] == nil {
                cows[number] = move
                continue
            }

            if cows[number] != move {
                cows[number] = move
                result += 1
            }
        }
        print(result)
    }
}
