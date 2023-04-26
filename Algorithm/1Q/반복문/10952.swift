//
//  10952.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/24.
//

import Foundation

// MARK: - 풀이 1
while true {
    if let input = readLine()?.components(separatedBy: " "),
       let a = Int(input[0]),
       let b = Int(input[1]) {

        if a + b != 0 {
            print(a + b)
        } else {
            break
        }
    }
}

// MARK: - 풀이 2
while true {
    let input = readLine()!
    let inputArray = input.split(separator: " ").map { Int($0)! }
    
    if inputArray[0] + inputArray[1] == 0 {
        break
    }
    print(inputArray[0] + inputArray[1])
}
