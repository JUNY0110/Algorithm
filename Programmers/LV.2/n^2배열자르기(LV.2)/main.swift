//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/08.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        let left = Int64(readLine()!)!
        let right = Int64(readLine()!)!
        print(solution(n, left, right))
    }
    
    func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
        var result = [Int]()
        var (y, x) = (0, 0)
        
        for i in Int(left)...Int(right) {
            x = (i % n) + 1
            y = (i / n) + 1

            result.append(y > x ? y : x)
        }
        
        return result
    }
}
