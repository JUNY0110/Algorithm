//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/31.
//

import Foundation

let main = Main()

main.run()

class Main {
    func run() {
        let babbling = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(babbling))
    }

    // aya yee u maa wyeoo
    // ayaye uuuma ye yemawoo ayaa
    func solution1(_ babbling:[String]) -> Int {
        let baby = ["aya", "ye", "woo", "ma"]
        var result = 0
        
        for bab in babbling {
            var stack = ""
            
            for char in bab {
                stack.append(char)
                
                if baby.contains(String(stack.suffix(stack.count))) {
                    stack.removeLast(stack.count)
                }
            }
            
            if stack.isEmpty {
                result += 1
            }
        }
        return result
    }
}
