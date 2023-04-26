//
//  2908.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/03.
//

import Foundation

class BaekJoon2908 {
    func run() {
        solution4()
    }
    
    func solution1() {
        if let input = readLine()?.reversed() {
            var numberArray = input.split(separator: " ").map{ Int(String($0))! }
            
            numberArray = numberArray.sorted(by: {$0 > $1})
            print(numberArray[0])
        }
    }
    
    func solution2() {
        print(readLine()!.reversed().split(separator: " ").map{ Int(String($0))! }.sorted(by: {$0 > $1})[0])
    }
    
    func solution3() {
        print(readLine()!.reversed().split(separator: " ").map{ Int(String($0))! }.max()!)
    }
    
    func solution4() {
        if let input = readLine()?.reversed() {
            let numberArray = input.split(separator: " ").map{ Int(String($0))! }
            
            print(numberArray.max()!)
        }
    }
}

