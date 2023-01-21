//
//  10814.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon10814 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let n = Int(readLine()!)!
        var memberList = [(age: Int, index: Int, name: String)]()
        
        for i in 0..<n {
            let member = readLine()!.split(separator: " ").map { String($0) }
            memberList.append((Int(member[0])!, i, member[1]))
        }
        
        memberList.sort(by: {$0.age == $1.age ? $0.index < $1.index : $0.age < $1.age})
        
        memberList.forEach {
            print($0.age, $0.name)
        }
    }
}
