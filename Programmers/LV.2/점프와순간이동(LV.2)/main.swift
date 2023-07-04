//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/04.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        print(solution(n))
    }
    
    func solution(_ n:Int) -> Int {
        var answer = 0
        var i = n
        
        while i > 0 {
            if i % 2 == 0 {
                i /= 2
                continue
            }
            answer += 1
            i -= 1
        }
        return answer
    }
}
