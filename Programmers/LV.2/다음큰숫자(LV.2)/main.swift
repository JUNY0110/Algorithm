//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/07/03.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let n = Int(readLine()!)!
        print(solution1(n))
    }

    func solution1(_ n:Int) -> Int
    {
        var answer = n + 1

        while true {
            if n.nonzeroBitCount == answer.nonzeroBitCount {
                break
            }
            answer += 1
        }
        return answer
    }
    
    func solution2(_ n:Int) -> Int
    {
        let cnt = String(n, radix:2).filter{$0 == "1"}.count
        var next = n
        var result = 0

        while true {
            next += 1

            if cnt == String(next, radix: 2).filter({ $0 == "1" }).count {
                result = next
                break
            }
        }

        return result
    }
}

