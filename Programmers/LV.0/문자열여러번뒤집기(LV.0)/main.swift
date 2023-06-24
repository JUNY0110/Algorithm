//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/24.
//

import Foundation

class Main {
    func solution(_ my_string:String, _ queries:[[Int]]) -> String {
        var str = my_string.map { String($0) }
        
        for q in queries {
            str[q[0]...q[1]] = ArraySlice(str[q[0]...q[1]].reversed())
        }
        
        return str.joined()
    }
}
