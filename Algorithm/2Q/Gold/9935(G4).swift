//
//  9935.swift
//  Algorithm
//
//  Created by 지준용 on 2023/05/19.
//

import Foundation

class BaekJoon9935 {
    func run() {
        solution1()
    }
    
    /// - NOTE: 문제풀이. 문자열, Stack
    /// - IMPORTANT:Stack에 나중에 들어온 Character가 먼저 나간다.
    /// -- 마지막에 들어온 글자(char)를 기준으로 주어진 글자(bomb)의 길이만큼 확인해서 bomb와 동일한 글자라면, 문자열에서 제거.
    
    /// - IMPORTANT: 72648KB / 208ms
    
    func solution1() {
        if let str = readLine(), let bomb = readLine() {
            let bombCount = bomb.count
            
            var stack = ""
            
            for char in str {
                stack += String(char)
//                stack.append(char)
                if char == bomb.last! && String(stack.suffix(bombCount)) == bomb {
                    stack.removeLast(bombCount)
                }
            }
            print(stack.isEmpty ? "FRULA" : String(stack))
        }
    }
    
    /// - IMPORTANT: Character 배열로 문제 풀이 -> 94712KB / 320ms
    
    func solution2() {
        if let str = readLine(), let bomb = readLine() {
            let bombCount = bomb.count

            var stack = [Character]()

            for char in str {
                stack.append(char)

                if char == bomb.last! && String(stack.suffix(bombCount)) == bomb {
                    stack.removeLast(bombCount)
                }
            }
            print(stack.isEmpty ? "FRULA" : String(stack))
        }
    }
    
    func solution3() {
        if let str = readLine(), let bomb = readLine() {
            let bombCount = bomb.count

            var stack = [Character]()

            for char in str {
                stack.append(char)

                if char == bomb.last! {
                    let stackCount = stack.count

                    if stackCount >= bombCount && String(stack[(stackCount - bombCount)...]) == bomb {
                        for _ in 0..<bombCount {
                            stack.popLast()
                        }
                    }
                }
            }

            print(stack.isEmpty ? "FRULA" : String(stack))
        }
    }
}
