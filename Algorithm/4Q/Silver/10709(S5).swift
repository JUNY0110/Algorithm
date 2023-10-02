//
//  10709.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/02.
//

import Foundation


final class BaekJoon10709 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let h = numbers[0], w = numbers[1]
        var sky = Array(repeating: Array(repeating: -1, count: w), count: h)
        
        for i in 0..<h {
            let isCloud = readLine()!.map { $0 == "c" ? true : false }
            
            for j in 0..<w {
                if isCloud[j] {
                    sky[i][j] = 0
                }
                
                if j < w-1 && sky[i][j+1] == -1 && sky[i][j] != -1 {
                    sky[i][j+1] = sky[i][j] + 1
                }
            }
        }
        
        sky.forEach {
            print($0.map { String($0) }.joined(separator: " "))
        }
    }
}
