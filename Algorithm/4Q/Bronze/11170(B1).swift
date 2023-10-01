//
//  11170.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon11170 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
            let n = numbers[0], m = numbers[1]
            var result = 0

            for number in n...m {
                var number = number
                
                repeat {
                    if number % 10 == 0 {
                        result += 1
                    }
                    number /= 10
                } while number != 0
            }
            print(result)
        }
    }
}
