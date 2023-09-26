//
//  1357.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon1357 {
    func run() {
        solution()
    }
    
    private func solution() {
        let numbers = readLine()!.split(separator: " ").map { String($0) }

        print(rev(numbers[0], numbers[1]))
    }
    
    private func rev(_ num1: String, _ num2: String) -> Int {
        let num1 = Int(String(num1.reversed()))!
        let num2 = Int(String(num2.reversed()))!
        let result = Int(String(String(num1 + num2).reversed()))!
        return result
    }
}
