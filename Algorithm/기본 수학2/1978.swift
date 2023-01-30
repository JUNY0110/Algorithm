//
//  1978.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/24.
//

import Foundation

class BaekJoon1978 {
    func run() {
        solution2()
    }

    func solution1() {

        let _ = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var result  = 0
        
        func isPrimeNumber(_ n: Int) -> Int {
            for i in 2..<n {
                if n % i == 0 {
                    result += 0
                    return result
                }
            }
            result += 1
            return result
        }
        nums.forEach {
            if $0 > 1 {
                result = isPrimeNumber($0)
            }
        }
        print(result)
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var nonPrimeNumber  = 0

        for num in nums {
            if num == 1 {
                nonPrimeNumber += 1
                continue
            }
            for i in 2..<num {
                if num % i == 0 {
                    nonPrimeNumber += 1
                    break
                }
            }
        }

        print(num - nonPrimeNumber)
    }
}
