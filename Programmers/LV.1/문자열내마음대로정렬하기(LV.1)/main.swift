//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/11.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let strings = readLine()!.split(separator: " ").map { String($0) }
        let n = Int(readLine()!)!
        print(solution(strings, n))
    }
    
    func solution(_ strings:[String], _ n:Int) -> [String] {
        var strings = strings.map { $0.map { String($0) } }
        
        strings.sort {
            if $0[n] == $1[n] {
                return $0.joined() < $1.joined()
            }
            return $0[n] < $1[n]
        }
        
        return strings.map { $0.joined() }
    }
}
