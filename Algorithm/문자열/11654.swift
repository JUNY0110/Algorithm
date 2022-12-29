//
//  11654.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/29.
//

//import Foundation

class BaekJoon11654 {
    func run() {
        solution2()
    }
    
    func solution1() {
        if let input = readLine(),
            let result = UnicodeScalar(input) { // UInt32타입
            print(result.value)
        }
    }
    
    func solution2() {
        if let input = readLine(),
            let result = Character(input).asciiValue { // UInt8타입
            print(Int(result))
        }
    }
}
if let input = readLine(),
    let result = Character(input).asciiValue { // UInt8타입
    print(result)
}
