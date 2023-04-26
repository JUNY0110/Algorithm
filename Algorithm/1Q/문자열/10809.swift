//
//  10809.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/30.
//

import Foundation

class BaekJoon10809 {
    func run() {
        solution5()
    }
    
    func solution1() {
        if let input = readLine() {
            let alphabetInt = Array<Int>(97...122)
            var inputArray = Array<Int>()
            var resultArray = Array<Int>()
            
            input.forEach {
                inputArray.append(Int(UnicodeScalar(String($0))!.value))
            }
            
            inputArray.forEach {
                if inputArray.firstIndex(of: $0) != inputArray.lastIndex(of: $0) {
                    inputArray.insert(0, at: inputArray.lastIndex(of: $0)!)
                    inputArray.remove(at: inputArray.lastIndex(of: $0)!)
                }
            }
            
            alphabetInt.forEach {
                for j in 0..<inputArray.count {
                    if $0 == inputArray[j] {
                        resultArray.append(j)
                    }
                }
                if !inputArray.contains($0) {
                    resultArray.append(-1)
                }
            }
            
            resultArray.forEach {
                print($0, terminator: " ")
            }
        }
    }
    
    func solution2() {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let inputArray = readLine()!.map { $0 }
        let result = alphabet.map { inputArray.firstIndex(of: $0) ?? -1 }
        
        result.forEach {
            print($0, terminator: " ")
        }
    }
    
    func solution3() {
        let inputArray = readLine()!.map { Int(UnicodeScalar((String($0)))!.value) }
        let result = (97...122).map { inputArray.firstIndex(of: $0) ?? -1 }
        
        result.forEach {
            print($0, terminator: " ")
        }
    }
    
    func solution4() {
        let inputArray = readLine()!.map { $0.asciiValue! }
        let result = (97...122).map { inputArray.firstIndex(of: $0) ?? -1 }
        
        result.forEach {
            print($0, terminator: " ")
        }
    }
    
    func solution5() {
        if let input = readLine() {
            let inputArray = input.map { $0.asciiValue ?? 0 }
            let result = (97...122).map { inputArray.firstIndex(of: $0) ?? -1 }
            
            result.forEach { print($0, terminator: " ") }
        }
    }
}
