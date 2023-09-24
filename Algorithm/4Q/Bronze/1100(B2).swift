//
//  1100.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon1100 {
    func run() {
        solution()
    }
    
    private func solution() {
        var result = 0
        
        for i in 0..<8 {
            let chessman = readLine()!.map { String($0) }
            
            for j in 0..<8 {
                if chessman[j] == "F" {
                    if (i % 2 == 0) && (j % 2 == 0) {
                        result += 1
                    }
                    if (i % 2 == 1) && (j % 2 == 1) {
                        result += 1
                    }
                }
            }
        }
        print(result)
    }
}
