//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/16.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let s = readLine()!
        print(solution(s))
        
    }

    func solution(_ s:String) -> Int {
        let s = s.map { $0 }
        var stack = ""
        var result = 0
        
        for char in s {
            stack += String(char) // 글자를 하나씩 담으면서

            let xCount = stack.filter { $0 == stack.first! }.count // 스택의 첫번째 글자가 몇개인지 확인

            if (stack.count - xCount) == xCount { // 전체 글자 중, 첫번째 글자를 뺀 갯수가 첫번째 글자의 갯수와 같아야 함.
                stack = "" // 스택을 비워주고
                result += 1 // 분해된 문자열의 갯수 + 1
            }
        }
        
        if !stack.isEmpty { // 읽을 글자가 부족해 남은 문자열을 추가로 분리해줌.
            result += 1
        }
        
        return result
    }
}
