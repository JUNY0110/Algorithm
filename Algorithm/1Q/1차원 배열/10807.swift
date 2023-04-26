//
//  10807.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/25.
//

import Foundation

// MARK: - 풀이 1(단순 풀이)
if let intAmount = Int(readLine()!) {
    let intInput = readLine()!.split(separator: " ").map { Int($0)! }
    let findingValue = Int(readLine()!)!
    
    if intAmount == intInput.count {
        var result = 0
        
        intInput.forEach {
            if $0 == findingValue {
                result += 1
            }
        }
        
        print(result)
    }
}

// MARK: - 풀이 2(고차함수 활용)
if let intAmount = Int(readLine()!) {
    let intInput = readLine()!.split(separator: " ").map { Int($0)! }
    let findingValue = Int(readLine()!)!
    
    if intAmount == intInput.count {
        var resultArray: [Int] = []
        
        resultArray = intInput.filter { $0 == findingValue }
        
        print(resultArray.count)
    }
}
