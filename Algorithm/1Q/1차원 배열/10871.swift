//
//  10871.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/25.
//

import Foundation

if let condition = readLine()?.components(separatedBy: " "),
let IntAmount = Int(condition[0]),
let maxValue = Int(condition[1]) {

    let valueArray = readLine()!.split(separator: " ").map { Int($0)! }
    var result: [Int] = []
    
    if IntAmount == valueArray.count {
        result = valueArray.filter { $0 < maxValue }
        result.forEach {
            print($0, terminator: " ")
        }
    }
}
