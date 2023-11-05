//
//  23968.swift
//  Algorithm
//
//  Created by 지준용 on 11/1/23.
//

import Foundation


final class BaekJoon23968 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nk[0] // 숫자 갯수
        var k = nk[1] // 교환 횟수
        
        var numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

        for i in 0..<n-1 {
            for j in 0..<n-i-1 where numbers[j] > numbers[j+1] {
                k -= 1
                
                numbers.swapAt(j, j+1)
                
                if k == 0 {
                    return print(numbers.map { String($0) }.joined(separator: " "))
                }
            }
        }
        
        if k != 0 {
            return print(-1)
        }
    }
}
