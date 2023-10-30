//
//  5576.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon5576 {
    func run() {
        solution()
    }
    
    private func solution() {
        var wUniv = Array(repeating: 0, count: 10)
        var kUniv = Array(repeating: 0, count: 10)
        
        for i in 0..<20 {
            let num = Int(readLine()!)!
            
            if i >= 10 {
                kUniv[i%10] = num
                continue
            }
            wUniv[i] = num
        }
        
        let w = wUniv.sorted(by: >)[0...2].reduce(0, +)
        let k = kUniv.sorted(by: >)[0...2].reduce(0, +)
        print(w, k)
        
    }
}
