//
//  17413.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/29.
//

import Foundation


class BaekJoon17413 {
    func run() {
        solution()
    }
    
    private func solution() {
        let s = readLine()!.map{ String($0) }
        var tag = ""
        var word = ""
        var result = ""
        
        for char in s {
            if char == "<" {
                tag += char
                
                if !word.isEmpty {
                    result += word.reversed()
                    word = ""
                }
                continue
            }
            
            if char == ">" {
                tag += char
                result += tag
                tag = ""
                continue
            }
            
            if tag.contains("<") {
                tag += char
            } else if char == " " {
                result += word.reversed() + char
                word = ""
            } else {
                word += char
            }
        }
        
        if !word.isEmpty {
            result += word.reversed()
        }
        print(result)
    }
}
