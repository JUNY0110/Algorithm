//
//  11720.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/30.
//

import Foundation

class BaekJoon11720 {
    func run() {
        solution5()
    }
    
    func solution1() {
        let conditionValue = Int(readLine()!)!
        let numberArray = readLine()!.map(String.init)
        var result = 0
        
        if conditionValue == numberArray.count {
            numberArray.forEach {
                result += Int($0)!
            }
        }
        print(result)
    }
    
    func solution2() {
        let _ = Int(readLine()!)!, numberArray = readLine()!.map(String.init)
        var result = 0
        
        numberArray.forEach {
            result += Int($0)!
        }
        print(result)
    }
    
    func solution3() {
        let _ = Int(readLine()!)!
        let numberArray = readLine()!.map{Int(String($0))!}
        
        print(numberArray.reduce(0, +))
    }
    
    func solution4() {
        if let condition = readLine(),
           let intAmount = Int(condition),
           let num = readLine() {
            let numArray = num.map { Int(String($0))! }
            
            if intAmount == numArray.count {
                print(numArray.reduce(0, +))
            }
        }
    }
    
    func solution5() {
        readLine()
        print(readLine()!.map{Int(String($0))!}.reduce(0, +))
    }
}
