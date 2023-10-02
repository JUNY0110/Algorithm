//
//  2526.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/02.
//

import Foundation


final class BaekJoon2526 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = numbers[0]
        let p = numbers[1]
        var temp = n * n % p
        var result = [n, temp]
        
        while true {
            temp = temp * n % p

            if result.contains(temp) {
                guard let index = result.firstIndex(of: temp) else { continue }
                print(result.count - index)
                break
            }
            
            result.append(temp)
        }
    }
}
