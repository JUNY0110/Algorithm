//
//  14626.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/15.
//

import Foundation

class BaekJoon14626 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var ISBN = readLine()!.map { String($0) }
        var results = [Int]()
        
        for i in 0..<ISBN.count {
            if ISBN[i] == "*" { ISBN[i] = "-1" }
            if i % 2 == 1 { results.append(3 * Int(ISBN[i])!) }
            else { results.append(Int(ISBN[i])!) }
        }

        var num = 0

        while num < 10 {
            if results.contains(-1) {
                if (results.reduce(0, +) + 1) % 10 == 0 {
                    print(0)
                    break
                }
                if ((results.reduce(0, +) + 1 + num) % 10) == 0 {
                    print(num)
                    break
                }
            }
            
            if results.contains(-3) {
                if (results.reduce(0, +) + 3) % 10 == 0 {
                    print(0)
                    break
                }
                if ((results.reduce(0, +) + 3 + num * 3) % 10) == 0 {
                    print(num)
                    break
                }
            }
            num += 1
        }
    }
    
    func solution2() {
        var ISBN = readLine()!.map { String($0) }
        var results = [Int]()
        
        for i in 0..<ISBN.count {
            if ISBN[i] == "*" { ISBN[i] = "-1" }
            if i % 2 == 1 { results.append(3 * Int(ISBN[i])!) }
            else { results.append(Int(ISBN[i])!) }
        }

        var num = 0

        while num < 10 {
            if results.contains(-1) && ((results.reduce(0, +) + 1 + num) % 10) == 0 { break }
    
            if results.contains(-3) && ((results.reduce(0, +) + 3 + num * 3) % 10) == 0 { break }
            num += 1
        }
        if num == 10 { print(0) }
        else { print(num) }
    }
    
    func solution3() {
        var ISBN = readLine()!.map { String($0) }
        var results = [Int]()
        var n = 1
        
        for i in 0..<ISBN.count {
            if ISBN[i] == "*" { ISBN[i] = "-1" }
            if i % 2 == 1 { results.append(3 * Int(ISBN[i])!) }
            else { results.append(Int(ISBN[i])!) }
        }

        var num = 0

        while num < 10 {
            if results.contains(-1) && ((results.reduce(0, +) + 1 + num) % 10) == 0 { break }
            if results.contains(-3) && ((results.reduce(0, +) + 3 + num * 3) % 10) == 0 { break }
            num += 1
        }
        if num == 10 { print(0) }
        else { print(num) }
    }
}
