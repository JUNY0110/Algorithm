//
//  2846.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation


final class BaekJoon2846 {
    func run() {
        solution()
    }
    
    private func solution() {
        let _ = readLine()!
        let heightArray = readLine()!.split(separator: " ").compactMap { Int($0) }
        var maxHeight = 0
        var result = [Int]()
        
        for i in 0..<heightArray.count-1 {
            if heightArray[i+1] <= heightArray[i] {
                maxHeight = 0
                continue
            }
            maxHeight += heightArray[i+1] - heightArray[i]
            result.append(maxHeight)
        }
        print(result.isEmpty ? 0 : result.max()!)
    }
}
