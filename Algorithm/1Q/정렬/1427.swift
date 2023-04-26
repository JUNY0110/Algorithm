//
//  1427.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/21.
//

import Foundation

class BaekJoon1427 {
    func run() {
        solution2()
    }
    
    func solution1() {
        let input = readLine()!.sorted(by: >)
        print(Int(String(input))!, terminator: "")
    }
    
    func solution2() {
        print(Int(String(readLine()!.sorted(by: >)))!, terminator: "")
    }
}
