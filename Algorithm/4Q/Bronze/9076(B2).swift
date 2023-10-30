//
//  9076.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon9076 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            var scores = readLine()!.split(separator: " ").compactMap { Int($0) }
            scores = scores.sorted(by: >)
            let realScores = scores[1...3]
            
            if realScores.max()! - realScores.min()! >= 4 {
                print("KIN")
                continue
            }
            print(realScores.reduce(0, +))
        }
    }
}
