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
    
    func solution1(_ s:String) -> String {
        var index = 0
        var result = ""
        for char in s {
            if char != " " {
                if index == 0 {
                    result += String(char).uppercased()
                } else {
                    result += String(char).lowercased()
                }
                index += 1
            } else {
                index = 0
                result += " "
            }
        }
        return result
    }
    
    func solution2(_ s:String) -> String {
        var s = s.lowercased().components(separatedBy: " ").map{$0.map{String($0)}}
        
        for i in 0..<s.count {
            if s[i].count > 0 {
                s[i].insert(s[i][0].uppercased(), at: 1)
                s[i].removeFirst()
            }
        }
        
        return s.map { $0.joined() }.joined(separator: " ")
    }
}
