//
//  2581.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/26.
//

import Foundation

/*
자연수 M과 N이 주어질 때 M이상 N이하의 자연수 중 소수인 것을 모두 골라 이들 소수의 합과 최솟값을 찾는 프로그램을 작성하시오.

예를 들어 M=60, N=100인 경우 60이상 100이하의 자연수 중 소수는 61, 67, 71, 73, 79, 83, 89, 97 총 8개가 있으므로, 이들 소수의 합은 620이고, 최솟값은 61이 된다.
 
 입력의 첫째 줄에 M이, 둘째 줄에 N이 주어진다.
 M과 N은 10,000이하의 자연수이며, M은 N보다 작거나 같다.
 
 M이상 N이하의 자연수 중 소수인 것을 모두 찾아 첫째 줄에 그 합을, 둘째 줄에 그 중 최솟값을 출력한다.
 단, M이상 N이하의 자연수 중 소수가 없을 경우는 첫째 줄에 -1을 출력한다.
 */

class BaekJoon2581 {
    func run() {
        solution4()
    }
    
    func solution1() {
        let startNum = Int(readLine()!)!
        let endNum = Int(readLine()!)!
        
        func isPrime(num: Int) -> Bool {
            var checkPrime = true
            
            if num < 2 {
                checkPrime = false
            } else {
                for i in 2..<num {
                    if num % i == 0 {
                        checkPrime = false
                    }
                }
            }
            return checkPrime
        }
        
        func allPrimeNumber(from startNum: Int, through endNum: Int) -> [Int] {
            var nums = [Int]()
            var results = [Int]()
            
            for i in startNum...endNum {
                nums.append(i)
            }
            
            for j in 0..<nums.count {
                if isPrime(num: nums[j]) {
                    results.append(nums[j])
                }
            }
            return results
        }
        
        if allPrimeNumber(from: startNum, through: endNum).isEmpty {
            print(-1)
        } else {
            print(allPrimeNumber(from: startNum, through: endNum).reduce(0, +))
            print(allPrimeNumber(from: startNum, through: endNum)[0])
        }
    }
    
    func solution2() {
        let startNum = Int(readLine()!)!
        let endNum = Int(readLine()!)!
        
        func isPrime(num: Int) -> Bool {
            var checkPrime = true
            
            if num < 2 {
                checkPrime = false
            } else {
                for i in 2..<num {
                    if num % i == 0 {
                        checkPrime = false
                    }
                }
            }
            return checkPrime
        }
        
        func allPrimeNumber(from startNum: Int, through endNum: Int) -> [Int] {
            let nums = Array<Int>(startNum...endNum)
            var results = [Int]()
            
            for j in 0..<nums.count {
                if isPrime(num: nums[j]) {
                    results.append(nums[j])
                }
            }
            return results
        }
        
        if allPrimeNumber(from: startNum, through: endNum).isEmpty {
            print(-1)
        } else {
            print(allPrimeNumber(from: startNum, through: endNum).reduce(0, +))
            print(allPrimeNumber(from: startNum, through: endNum)[0])
        }
    }
    
    func solution3() {
        let startNumber = Int(readLine()!)!
        let endNumber = Int(readLine()!)!
        var primeNumbers = [Int]()
        
        func isPrime(num: Int) -> Bool {
            if num != 1 {
                for i in 2..<num {
                    if num % i == 0 {
                        return false
                    }
                }
            } else {
                return false
            }
            return true
        }
        
        for num in stride(from: startNumber, through: endNumber, by: 1) {
            if isPrime(num: num) {
                primeNumbers.append(num)
            }
        }
        if primeNumbers.isEmpty {
            print(-1)
        } else {
            print(primeNumbers.reduce(0, +))
            print(primeNumbers[0])
        }
    }
    
    func solution4() {
        var results = [Int]()

        func isPrime(num: Int) -> Bool {
            if num < 2 { return false }
            else { for i in 2..<num where (num % i == 0) { return false } }
            return true
        }

        for num in Int(readLine()!)!...Int(readLine()!)! where isPrime(num: num) { results.append(num) }

        print(results.isEmpty ? -1 : "\(results.reduce(0, +))\n\(results[0])")
    }
}
