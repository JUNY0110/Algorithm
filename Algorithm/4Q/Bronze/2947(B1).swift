//
//  2947.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon2947 {
    func run() {
        solution()
    }
    
    private func solution() {
        var sticks = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        while sticks != sticks.sorted() {
            for i in 0..<sticks.count-1 where sticks[i] > sticks[i+1] {
                sticks.swapAt(i, i+1)
                print(sticks.map { String($0) }.joined(separator: " "))
            }
        }
    }
}
