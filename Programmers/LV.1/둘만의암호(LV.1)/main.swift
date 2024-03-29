//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/30.
//

import Foundation
class Main {
    func run() {
        let s = readLine()!
        let skip = readLine()!
        let index = Int(readLine()!)!
        print(solution(s, skip, index))
    }
    
    func solution(_ s:String, _ skip:String, _ index:Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
        var s = s.map { String($0) }
        
        for i in 0..<s.count {
            if var c = alphabet.firstIndex(of: s[i]) {
                var index = index
                
                while index != 0 {
                    c += 1
                    c %= 26
                    
                    if skip.contains(alphabet[c]) { continue }
                    
                    index -= 1
                    s[i] = alphabet[c]
                }
            }
        }
        return s.joined()
    }
}
