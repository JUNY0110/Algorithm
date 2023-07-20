//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/20.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let elements = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(elements))
    }
    
    func solution(_ elements:[Int]) -> Int {
        var result = Set<Int>()
        let temp = elements + elements
        
        func calculate(_ start: Int, _ end: Int, _ arr: [Int]) {
            if start == end {
                return
            }
            
            var sum = 0
            
            for i in start..<end {
                sum += arr[i]
                result.insert(sum)
            }
            
            if end < arr.count {
                calculate(start+1, end + 1, arr)
            } else {
                calculate(start+1, end, arr)
            }
        }
        
        calculate(0, elements.count, temp)
        
        return result.count
    }
}
