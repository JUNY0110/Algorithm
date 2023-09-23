//
//  2455.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/23.
//

import Foundation

class BaekJoon2455 {
    func run() {
        solution()
    }
    
    private func solution() {
        var passengers = 0
        var stack = [Int]()
        
        for _ in 0..<4 {
            let people = readLine()!.split(separator: " ").map { Int(String($0))! }
            let getOut = people[0]
            let getIn = people[1]
            
            passengers = passengers - getOut + getIn
            
            if passengers > 10000 {
                passengers = 10000
            }
            
            stack.append(passengers)
        }
        print(stack.max() ?? 0)
    }
}
