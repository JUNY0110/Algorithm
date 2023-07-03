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
        let s = readLine()!
        print(solution(s))
    }
    
    func solution(_ s:String) -> Int{
        var stack = [Character]()
        
        for char in s {
            if let before = stack.last {
                if before == char {
                    stack.removeLast()
                    continue
                }
            }
            stack.append(char)
        }
        
        return stack.isEmpty ? 1 : 0
    }
}
