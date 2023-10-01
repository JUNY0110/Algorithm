//
//  2810.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon2810 {
    func run() {
        solution()
    }
    
    private func solution() {
        let people = Int(readLine()!)!
        let seats = readLine()!.map { String($0) }
        var stack = ""
        var count = 1
        
        for seat in seats {
            if seat == "S" {
                count += 1
                continue
            }
            stack.append(seat)
            
            if stack.contains("LL") {
                count += 1
                stack = ""
            }
        }
        print(min(people, count))
    }
}
