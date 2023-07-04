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
        let words = readLine()!.split(separator: " ").map { String($0) }
        print(solution(n, words))
    }
    
    
    func solution(_ n:Int, _ words:[String]) -> [Int] {
        // 단어 갯수만큼 돌아가고
        // 끝말잇기 단어가 아니면 종료
        // 이전에 등장한 단어이면 종료 -> Stack
        var stack = [String]()
        var result = [0, 0]
        
        for i in 0..<words.count {
            let lastWord = stack[stack.index(before: stack.endIndex)]
            let lastChar = lastWord[lastWord.index(before: lastWord.endIndex)]
            let firstChar = words[i][words[i].startIndex]
            
            if stack.contains(words[i]) || lastChar != firstChar {
                result = [i % n + 1, i / n + 1]
                break
            }
            
            stack.append(words[i])
        }
        
        return result
    }
}
