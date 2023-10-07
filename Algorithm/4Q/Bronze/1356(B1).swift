//
//  10994.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/07.
//

import Foundation


final class BaekJoon1356 {
    func run() {
        solution()
    }
    
    private func solution() {
        guard let input = readLine() else { return }
        let numbers = input.compactMap { Int(String($0)) }
        var count = 1
        
        while count != numbers.count {
            let front = numbers.prefix(count).reduce(1, *)
            let back = numbers.suffix(numbers.count - count).reduce(1, *)
            
            if front == back {
                return print("YES")
            }
            
            count += 1
        }
        print("NO")
    }
}
