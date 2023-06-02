//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/02.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        let citations = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(citations))
    }
    
    // 3 0 6 1 5 -> 3
    
    func solution(_ citations:[Int]) -> Int {
        let citations = citations.sorted(by: >)
        var result = 0
        
        for h in 0..<citations.count {
            if citations[h] >= h+1 {
                result += 1
            } else {
                break
            }
        }
        return result
    }
}
