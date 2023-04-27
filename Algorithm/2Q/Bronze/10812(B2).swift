//
//  10812.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/27.
//

//import Foundation

class BaekJoon10812 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
        var baskets = Array<Int>(1...nm[0])
        
        for _ in 0..<nm[1] {
            let rotate = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
            let begin = rotate[0]
            let end = rotate[1]
            let mid = rotate[2]
            
            baskets.insert(contentsOf: baskets[begin..<mid], at: end + 1)
            baskets.removeSubrange(begin..<mid)
        }
        print(baskets.map{"\($0)"}.joined(separator: " "))
    }
    
    func solution2() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        var baskets = Array<Int>(1...nm[0])
        
        for _ in 0..<nm[1] {
            let rotate = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
            let begin = rotate[0]
            let end = rotate[1]
            let mid = rotate[2]
            
            let temps = baskets[mid...end] + baskets[begin..<mid]
            baskets.replaceSubrange(begin...end, with: temps)
        }
        baskets.forEach{ print($0, terminator: " ") }
    }
}
