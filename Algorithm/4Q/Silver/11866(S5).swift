//
//  11866.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/25.
//

import Foundation

class BaekJoon11866 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let numbers = readLine()!.split(separator: " ").compactMap{ Int($0) }
        let n = numbers[0]
        let k = numbers[1]
        
        var array = Array(1...n)
        var index = 0
        var result = [Int]()
        
        while !array.isEmpty {
            index = (index + k - 1) % array.count
            
            let removal = array.remove(at: index)
            result.append(removal)
        }
        
        print("<\(result.map { String($0) }.joined(separator: ", "))>")
    }
    
    
    private func solution2() {
        let numbers = readLine()!.split(separator: " ").compactMap{ Int($0) }
        let n = numbers[0]
        let k = numbers[1]

        var array = Array(1...n)
        var count = 0
        var index = 0
        var result = ""

        while !array.isEmpty {
            count += 1

            if count % k == 0 {
                let removal = array.remove(at: index)
                index -= 1
                result += "\(removal) "
            }

            index += 1

            if index == array.count {
                index = 0
            }
        }
        print("<" + result.split(separator: " ").joined(separator: ", ") + ">")
    }
}
