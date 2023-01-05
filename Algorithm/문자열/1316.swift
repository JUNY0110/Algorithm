//
//  1316.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/04.
//

import Foundation

class BaekJoon1316 {
    func run() {
        solution2()
    }
    
    func solution1() {
        if let condition = readLine(),
           let num = Int(condition) {
            var result = 0
            
            for _ in 0..<num {
                let input = readLine()!.map { String($0) }
                var tempArray = [String]()
                
                for index in input.indices {
                    if !tempArray.contains(input[index]) {
                        tempArray.append(input[index])
                    }
                    
                    if index > 0 && input[index - 1] == input[index] {
                        tempArray.append(input[index])
                    }
                }
                if tempArray == input {
                    result += 1
                }
            }
            print(result)
        }
    }
    
    func solution2() {
        if let condition = readLine(),
           let num = Int(condition) {
            var result = 0
            
            for _ in 0..<num {
                if let input = readLine() {
                    let inputArray = input.map { String($0) }
                    var tempArray = [String]()
                    
                    for index in inputArray.indices
                    where !tempArray.contains(inputArray[index]) ||
                    index > 0 && inputArray[index - 1] == inputArray[index] {
                        
                        tempArray.append(inputArray[index])
                        
                    }
                    if tempArray == inputArray {
                        result += 1
                    }
                }
            }
            print(result)
        }
    }
}
