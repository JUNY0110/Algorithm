//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/27.
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
        let voca = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
                   "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
        var temp = ""
        var result = ""

        for char in s {
            // 숫자여부 체크, 문자라면 임시 저장
            if Int(String(char)) != nil {
                result += String(char)
            } else {
                temp += String(char)
            }

            // 합친 문자가 단어장에 있는 단어이면 치환, 임시값 비우기
            if voca.keys.contains(temp) {
                result += voca[temp]!
                temp = ""
            }
        }

        return Int(result)!
    }
    
    func solution2(_ s:String) -> Int {
        let voca = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
                   "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
        var result = s
        
        for (key, value) in voca {
            result = result.replacingOccurrences(of: key, with: value)
        }
        
        return Int(result) ?? -1
    }
}
