//
//  4948.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/05.
//

//import Foundation

class BaekJoon4849 {
    func run() {
        solution3()
    }
    
    func solution1() {
        
        // 소수규칙1: 1은 소수가 아니다.
        // 소수규칙2: 제곱 미만의 수만 구하면 된다.
        // 소수규칙3: 소수는 1과 자기자신만을 인수로 가진다.
        
        while true {
            let num = Int(readLine()!)!
            var count = 0

            if num == 0 { break }
            
            for n in (num + 1)...(num * 2) {

                if n == 1 { continue }
                
                var value = 2
                var isPrime = true
                
                while value * value <= n {
                    if n % value == 0 {
                        isPrime = false
                        break
                    }
                    value += 1
                }
                if isPrime { count += 1 }
            }
            print(count)
        }
    }
    
    func solution2() {
        let maxNum = 123456 * 2 + 1
        var notPrimes = Array(repeating: false, count: maxNum)
        notPrimes[0] = true
        notPrimes[1] = true
        
        for i in 2..<maxNum {
            if notPrimes[i] { continue }
            for j in stride(from: i * i, to: maxNum, by: i) { notPrimes[j] = true }
        }

        while true {
            var count = 0
            let num = Int(readLine()!)!

            if num == 0 { break }

            for i in  (num + 1)...(num * 2) {
                if !notPrimes[i] { count += 1 }
            }
            print(count)
        }
    }
    
    func solution3() {
        let maxNum = 123456 * 2
        var isPrimes = Array(repeating: true, count: maxNum + 1)

        isPrimes[1] = false

        for i in 2..<maxNum {
            if !isPrimes[i] { continue }
            for j in stride(from: i * i, through: maxNum, by: i) { isPrimes[j] = false }
        }

        while true {
            var count = 0
            let num = Int(readLine()!)!

            if num == 0 { break }

            for i in (num + 1)...(num * 2) {
                if isPrimes[i] { count += 1 }
            }
            print(count)
        }
    }
}
