//
//  5800.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon5800 {
    func run() {
        solution()
    }
    
    private func solution() {
        let k = Int(readLine()!)!
        
        for i in 1...k {
            var scores = readLine()!.split(separator: " ").compactMap { Int($0) }
            scores.removeFirst()
            scores.sort(by: >)
            
            guard let max = scores.max(),
                  let min = scores.min() else { continue }
            var gap = Int.min
            
            for j in 0..<scores.count-1 {
                if scores[j]-scores[j+1] > gap {
                    gap = scores[j]-scores[j+1]
                }
            }
            print("Class \(i)")
            print("Max \(max), Min \(min), Largest gap \(gap)")
        }
    }
}
