//
//  1032.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/24.
//

import Foundation

class BaekJoon1032 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        var result = Array(repeating: "", count: 50)
        
        for _ in 0..<num {
            let fileName = readLine()!.map { String($0) }
            
            for i in 0..<fileName.count {
                if result[i].isEmpty {
                    result[i] = fileName[i]
                    continue
                }
                if result[i] != fileName[i] {
                    result[i] = "?"
                }
            }
        }
        print(result.joined())
    }
}
