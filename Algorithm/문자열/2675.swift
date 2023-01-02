//
//  2675.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/02.
//

import Foundation

class BaekJoon2675 {
    func run() {
        solution3()
    }
    
    func solution1() {
        if let condition = Int(readLine()!) {
            for _ in 0..<condition {
                let inputArray = readLine()!.map { String($0) }

                for i in 0..<inputArray.count - 2 {
                    print(String(repeating: inputArray[i + 2], count: Int(inputArray.first!)!), terminator: "")
                }
                print("")
            }
        }
    }
    
    func solution2() {
        if let inputT = readLine(),
           let t = Int(inputT) {
            
            for _ in 0..<t {
                if let condition = readLine() {
                    let conditions = condition.split(separator: " ").map { String($0) }
                    let r = conditions[0]
                    let p = conditions[1].map{String($0)}
                    
                    p.forEach {
                        print(String(repeating: $0, count: Int(r) ?? 0), terminator: "")
                    }
                    print("")
                }
            }
        }
    }
    
    func solution3() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let conditions = readLine()!.split(separator: " ").map { String($0) }
            let r = conditions[0]
            let p = conditions[1].map { String($0) }
            
            p.forEach { print(String(repeating: $0, count: Int(r)!), terminator: "") }
            print("")
        }
    }
}

