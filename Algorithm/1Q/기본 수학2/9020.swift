//
//  9020.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/05.
//

import Foundation

class BaekJoon9020 {
    func run() {
        solution2()
    }
    
    func solution1() {
        var isPrimes = Array(repeating: true, count: 10001)
        let T = Int(readLine()!)!

        isPrimes[1] = false

        for _ in 0..<T {
            let n = Int(readLine()!)!
            var primes = [Int]()
            var results = [[Int]]()

            for i in 2..<10001 {
                if !isPrimes[i] { continue }
                for j in stride(from: i * i, to: 10001, by: i) { isPrimes[j] = false }
            }

            for i in 2...n {
                if isPrimes[i] { primes.append(i) }
            }

            for i in 0..<primes.count {
                for j in primes.count/2..<primes.count {
                    if primes[i] + primes[j] == n {
                        results.append([primes[i], primes[j]])
                    }
                }
            }
            let temp1: [[Int]] = results.filter{$0[0] == $0[1]}
            if n == 4 {
                print(2,2)
            } else if temp1 != [] {
                print(temp1[0].map{"\($0)"}.joined(separator: " "))
            } else {
                results = results.filter{$0[0] < $0[1]}
                print(results.last!.map{"\($0)"}.joined(separator: " "))
            }
        }
    }
    
    func solution2() {
        let t = Int(readLine()!)!
        
        var primes = Array(repeating: true, count: 10001)
        
        primes[0] = false
        primes[1] = false
        
        for i in 2...10000 {
            if primes[i] {
                for j in stride(from: i * i, to: 10001, by: i) {
                    primes[j] = false
                }
            }
        }
        
        for _ in 0..<t {
            let n = Int(readLine()!)!
            
            var partition = n / 2

            while true {
                if primes[abs(n - partition)] && primes[partition] {
                    print(n - partition < partition ?
                          "\(n - partition) \(partition)" :  "\(partition) \(n - partition)")
                    break
                } else {
                    partition -= 1
                }
            }
        }
    }
}
