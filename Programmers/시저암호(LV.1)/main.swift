//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/04.
//

import Foundation
let main = Main()

main.run()

class Main {
    
    func run() {
        let s = readLine()!
        let n = Int(readLine()!)!
        print(solution3(s, n))
    }
    // AB       1 -> BC
    // z        1 -> a
    // a B z    4 -> e F d
    
    func solution1(_ s:String, _ n:Int) -> String {
        let upper = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                     "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                     "U", "V", "W", "X", "Y", "Z"]
        let lower = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                    "u", "v", "w", "x", "y", "z"]
        var result = ""
        
        for char in s {
            if char != " " {
                if char.isUppercase {
                    guard var index = upper.firstIndex(of: String(char)) else { break }
                    index = (index + n) % 26
                    result += upper[index]
                } else {
                    guard var index = lower.firstIndex(of: String(char)) else { break }
                    index = (index + n) % 26
                    result += lower[index]
                }
            } else {
                result += " "
            }
        }
        return result
    }
    
    func solution2(_ s:String, _ n:Int) -> String {
        let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
                        "U", "V", "W", "X", "Y", "Z",
                        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                        "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                        "u", "v", "w", "x", "y", "z"]
        var s = s.map { String($0) }
        var result = ""

        for char in s {
            let str = String(char)

            if str != " " {
                var index = alphabet.firstIndex(of: str)!

                if index < 26 {
                    // 대문자
                    index += n

                    if index >= 26 {
                        index -= 26
                    }
                } else {
                    // 소문자
                    index += n

                    if index >= 52 {
                        index -= 26
                    }
                }

                result += alphabet[index]
            } else {
                result += " "
            }
        }
        return result
    }
    
    func solution3(_ s:String, _ n:Int) -> String {
        let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
        return String(s.map {
            guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0}
            let letter = alphabets[(index + n) % 26]
            return $0.isUppercase ? Character(letter.uppercased()) : letter
        })
    }
}
