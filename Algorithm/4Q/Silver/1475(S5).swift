//
//  1475.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/26.
//

import Foundation

class BaekJoon1475 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let number = readLine()!.compactMap { Int(String($0)) }
        var numbers = [Int: Int]()
        
        for num in Array(0...9) {
            numbers[num] = 0
        }
        
        for num in number {
            numbers[num, default: 0] += 1
        }
        
        var minSet = 0
        
        for (key, value) in numbers where key != 6 && key != 9 {
            if minSet < value {
                minSet = value
            }
        }
        
        let temp = ((numbers[6]! + numbers[9]!) / 2) + ((numbers[6]! + numbers[9]!) % 2)
        
        if temp > minSet {
            minSet = temp
        }
        print(minSet)
    }
    
    private func solution2() {
        let number = readLine()!.compactMap { Int(String($0)) }
        var numbers = Array(repeating: 0, count: 10)
        
        for num in number {
            numbers[num] += 1
        }
        
        numbers[6] = (numbers[6] + numbers.removeLast() + 1) / 2
        print(numbers.max()!)
    }
}
