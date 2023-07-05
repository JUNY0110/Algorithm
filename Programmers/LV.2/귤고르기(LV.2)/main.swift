//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/05.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let k = Int(readLine()!)!
        let tangerine = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(k, tangerine))
    }
    
    func solution(_ k:Int, _ tangerine:[Int]) -> Int {
        let distribution = Dictionary(grouping: tangerine, by: {$0}).sorted{
            return $0.value.count < $1.value.count
        }

        var n = tangerine.count - k
        var count = 0
        
        for v in distribution.map ({ $0.value }) {
            if n >= v.count {
                n -= v.count
                continue
            }
            count += 1
        }
        return count
    }
}
