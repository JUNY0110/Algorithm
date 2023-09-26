//
//  1212.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/25.
//

import Foundation

class BaekJoon1212 {
    func run() {
        solution()
    }
    
    private func solution() {
        let input = readLine()!.map { String($0) }
        var binaryArray = [String(Int(input.first!)!, radix: 2)]
        
        for number in input[1...] {
            let binaryNumber = String(Int(number)!, radix: 2)
            let string = String(format: "%03d", Int(binaryNumber)!)
            
            binaryArray.append(string)
        }
        print(binaryArray.joined())
    }
}
