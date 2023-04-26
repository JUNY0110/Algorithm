//
//  2744.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/12.
//

import Foundation

class BaekJoon2744 {
    func run() {
        solution()
    }
    
    func solution() {
        let input = readLine()!
        var array = [String]()

        input.forEach {
            if $0.asciiValue! < 97 {
                array.append($0.lowercased())
            }
            if $0.asciiValue! >= 97 {
                array.append($0.uppercased())
            }
        }
        print(array.map{"\($0)"}.joined(separator: ""))
    }
    
    func solution2() {
        print(readLine()!.map{"\($0.asciiValue! < 97 ? $0.lowercased() : $0.uppercased())"}.joined(separator: ""))
    }
    
    func solution3() {
        print(readLine()!.map{$0.isLowercase ? $0.uppercased() : $0.lowercased()}.joined())
    }
}
