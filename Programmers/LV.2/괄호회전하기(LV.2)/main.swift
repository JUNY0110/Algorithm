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
        let s = readLine()!
        print(solution1(s))
    }
    
    func solution1(_ s:String) -> Int {
        var s = s.map { String($0) }
        var count = s.count
        var result = 0
        
        while count > 0 {
            var stack = ""
            
            count -= 1
            
            for char in s {
                if let last = stack.last {
                    if last == "[" && char == "]" ||
                    last == "(" && char == ")" ||
                    last == "{" && char == "}" {
                        stack.removeLast()
                        continue
                    }
                }
                stack.append(char)
            }
            
            if stack.isEmpty {
                result += 1
            }
            
            let cycle = s.removeFirst()
            s.append(cycle)
        }
        return result
    }
    
    func solution2(_ s:String) -> Int {
        var s = s.map { String($0) }
        var count = s.count
        var result = 0

        while count > 0 {
            var stack = ""

            count -= 1

            for char in s {
                if let last = stack.last {
                    switch last {
                    case "[" where char == "]":
                        stack.removeLast()
                    case "(" where char == ")":
                        stack.removeLast()
                    case "{" where char == "}":
                        stack.removeLast()
                    default: stack.append(char)
                    }
                    continue
                }
                stack.append(char)
            }

            if stack.isEmpty {
                result += 1
            }

            let cycle = s.removeFirst()
            s.append(cycle)
        }
        return result
    }
}
