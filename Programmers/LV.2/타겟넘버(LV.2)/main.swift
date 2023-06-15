//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/15.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        let target = Int(readLine()!)!
        print(solution(numbers, target))
    }
    
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        let sum = numbers.reduce(0, +)
        var result = 0
        
        func dfs(_ start: Int, _ sum: Int) {
            if sum == target {
                result += 1
            }
            
            for i in start..<numbers.count {
                dfs(i+1, sum - (numbers[i] * 2))
            }
        }
        
        dfs(0, sum)
        
        return result
    }
}
