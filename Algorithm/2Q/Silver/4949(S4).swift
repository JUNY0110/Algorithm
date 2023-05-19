//
//  4949.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/19.
//

import Foundation

class BaekJoon4949 {
    func run() {
        solution2()
    }
    
    /// - NOTE: 문제풀이. 소괄호 대괄호.
    /// - IMPORTANT:괄호를 제외한 나머지 문자열은 배제하고, 괄호만 Stack에 반영
    
    func solution1() {
        let squareBracket = "[]"
        let parenthesis = "()"

        while let input = readLine(), input != "." {
            var stack = ""
            
            for char in input {
                if (squareBracket + parenthesis).contains(char) {
                    stack += String(char)
                    
                    if stack.suffix(2) == squareBracket || stack.suffix(2) == parenthesis {
                        stack.removeLast(2)
                    }
                }
            }
            print(stack.isEmpty ? "yes" : "no")
        }
    }
    
    func solution2() {
        while let input = readLine(), input != "." {
            var stack = ""
            
            for char in input {
                if char == "[" || char == "]" || char == "(" || char == ")" {
                    stack += String(char)
                    
                    if stack.suffix(2) == "[]" || stack.suffix(2) == "()" {
                        stack.removeLast(2)
                    }
                }
            }
            print(stack.isEmpty ? "yes" : "no")
        }
    }
}
