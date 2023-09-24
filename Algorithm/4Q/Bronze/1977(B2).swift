//
//  1977.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon1977 {
    func run() {
        solution()
    }
    
    private func solution() {
        let minNumber = ceil(sqrt(Double(readLine()!)!))
        let maxNumber = floor(sqrt(Double(readLine()!)!))
        var result = 0
        
        if minNumber >= maxNumber {
            return print(-1)
        }
        
        for number in Int(minNumber)...Int(maxNumber) {
            result += number * number
        }
        
        print(result)
        print(Int(minNumber * minNumber))
    }
}
