//
//  11655.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon11655 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let alphabet = readLine()!.map { $0 }
        var result = ""

        for char in alphabet {
            if char.isNumber || char == " " {
                result += String(char)
                continue
            }

            if let ascii = char.asciiValue {
                let encoded = ascii + 13

                if (65...90) ~= ascii && encoded <= 90 
                    || (97...122) ~= ascii && encoded <= 122 {
                    result += String(UnicodeScalar(encoded))
                    continue
                }

                result += String(UnicodeScalar(encoded - 26))
            }
        }
        print(result)
    }
    
    private func solution2() {
        let input = readLine()!
        let alphabet = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
        var result = ""
        
        for char in input {
            if char.isLetter {
                guard var index = alphabet.firstIndex(of: String(char.lowercased())) else { continue }
                index += 13
                
                if index >= 26 {
                    result += char.isLowercase ? alphabet[index - 26] : alphabet[index-26].uppercased()
                } else {
                    result += char.isLowercase ? alphabet[index] : alphabet[index].uppercased()
                }
                continue
            }
            result += String(char)
        }
        print(result)
    }
}
