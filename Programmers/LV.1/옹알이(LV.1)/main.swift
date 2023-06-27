//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/26.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let babbling = readLine()!.split(separator: " ").map { String($0) }
        print(solution1(babbling))
    }
    
    func solution1(_ babbling:[String]) -> Int {
        let impossible = ["ayaaya", "yeye", "woowoo", "mama"]
        let possible = ["aya", "ye", "woo", "ma"]
        let babbling = babbling.filter { !($0.contains(impossible[0])
                                        || $0.contains(impossible[1])
                                        || $0.contains(impossible[2])
                                        || $0.contains(impossible[3])) }
        var count = 0

        for babble in babbling {
            var stack = ""

            for s in babble {
                stack += String(s)
                
                if possible.contains(stack) {
                    stack = ""
                    continue
                }
                // 스택이 발음할 수 있는 단어의 최대길이를 넘기면 더이상 확인하지 않음.
                if stack.count > 3 {
                    break
                }
            }

            if stack.isEmpty {
                count += 1
            }
        }

        return count
    }
    
    func solution2(_ babbling:[String]) -> Int {
        let impossible = ["ayaaya", "yeye", "woowoo", "mama"]
        let possible = ["aya", "ye", "woo", "ma"]
        var count = 0

        for babble in babbling {
            var word = babble

            for i in 0..<possible.count {
                word = word.replacingOccurrences(of: possible[i], with: "\(i+1)")
            }

            if Int(word) != nil && !(word.contains("11") || word.contains("22")
                                     || word.contains("33") || word.contains("44"))  {
                count += 1
            }
        }
     
        return count
    }
}
