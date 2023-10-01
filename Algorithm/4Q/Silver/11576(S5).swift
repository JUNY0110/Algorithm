//
//  11576.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation


final class BaekJoon11576 {
    func run() {
        solution()
    }
    
    private func solution() {
        let radixArray = readLine()!.split(separator: " ").compactMap { Int($0) }
        let radixA = radixArray[0], radixB = radixArray[1]
        
        let m = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
        var decimal = 0

        for i in 0..<m {
            decimal += numbers[i] * Int(pow(Double(radixA), Double(i)))
        }
        
        let result = convertFromDecimal(decimal, radixB)
        
        print(result.map { String($0) }.joined(separator: " "))
        
        func convertFromDecimal(_ number: Int, _ base: Int) -> [Int] {
            var result = [Int]()
            var number = number
            
            while number > 0 {
                let remainder = number % base
                result.append(remainder)
                number /= base
            }
            
            return result
        }
    }
    
    
    private func solution2() {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let fromBase = input[0]
        let toBase = input[1]

        let _ = readLine()
        let number = readLine()!.split(separator: " ").compactMap { Int($0) }

        let decimalValue = convertToDecimal(number, fromBase)
        let result = convertFromDecimal(decimalValue, toBase)
        
        print(result.map { String($0) }.joined(separator: " "))
        
        func convertToDecimal(_ number: [Int], _ base: Int) -> Int {
            var result = 0
            
            for digit in number {
                result = result * base + digit
            }
            
            return result
        }

        func convertFromDecimal(_ number: Int, _ base: Int) -> [Int] {
            var result = [Int]()
            var n = number
            
            while n > 0 {
                let remainder = n % base
                result.append(remainder)
                n /= base
            }
            print(result)
            return result.reversed()
        }
    }
}
