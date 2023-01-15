//
//  2566.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/13.
//

import Foundation

class BaekJoon2566 {
    func run() {
        solution3()
    }
    func solution1() {
        var input = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var num: [Int] = []
        var dictionary = [Int: Int]()
        
        for (index, _) in input.enumerated() {
            num = readLine()!.split(separator: " ").map{ Int(String($0))! }
            input[index] = num
            
            dictionary[index + 1] = num.max()
        }
        
        print(dictionary.values.max()!)
        print(dictionary.first(where: {$0.value == dictionary.values.max()})!.key, input[dictionary.first(where: {$0.value == dictionary.values.max()})!.key - 1].firstIndex(of: dictionary.values.max()!)! + 1)
    }
    
    func solution2() {
        var input = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var dictionary = [Int: Int]()
        
        for index in 0..<input.count {
            let lines = readLine()!.split(separator: " ").map{ Int(String($0))! }
            
            input[index] = lines
            dictionary[index] = lines.max()
        }
        
        if let maxValue = dictionary.values.max() {
            let line = dictionary.first(where: {$0.value == maxValue})!.key
            let row = input[line].firstIndex(of: maxValue)! + 1
            
            print(maxValue)
            print(line + 1, row)
        }
    }
    
    func solution3() {
        var matrix = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var maxValue = 0
        
        for line in 0..<9 {
            matrix[line] = readLine()!.split(separator: " ").map{ Int(String($0))! }
        }
        
        var lineNum = 0
        var rowNum = 0
        
        for i in 0..<matrix.count {
            if maxValue <= matrix[i].max() ?? -1 {
                maxValue = matrix[i].max() ?? -1
                lineNum = i + 1
                rowNum = matrix[i].firstIndex(of: maxValue)! + 1
            }
            
        }
        print(maxValue)
        print(lineNum, rowNum)
    }
}
