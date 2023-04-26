//
//  1929.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/03.
//

import Foundation

class BaekJoon1929 {
    func run() {
        solution3()
    }
    
    func solution1() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = nums[0]
        let b = nums[1]
        
        for num in a...b {
            if num == 1 {
                continue
            }
            
            var n = 2
            var isPrime = true
            
            while n * n <= num {
                if num % n == 0 {
                    isPrime = false
                    break
                }
                n += 1
            }
            
            if isPrime {
                print(num)
            }
        }
    }
    
    func solution2() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = nums[0]
        let b = nums[1]
        var bools = Array(repeating: true, count: b + 1)
        
        if b > 1 {
            for num in 2...Int(ceil(sqrt(Double(b)))) {
                for n in 2...num where num % n == 0 {
                    for i in stride(from: num + num, through: b, by: num) {
                        bools[i] = false
                    }
                    break
                }
            }

            if a == b && bools[a] {
                print(a)
            } else {
                let temp = (a == 1) ? (a + 1) : a

                for i in temp...b {
                    if bools[i] {
                        print(i)
                    }
                }
            }
        }
    }
    
    func solution3() {
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        let n = nums[1]
        var bools = Array(repeating: true, count: n + 1)

        bools[1] = false
        
        for i in 2...Int(ceil(sqrt(Double(n)))) {
            if !bools[i] {
                continue
            }
            
            for j in stride(from: i + i, through: n, by: i) {
                bools[j] = false
            }
        }
        
        for i in nums[0]...nums[1] {
            if bools[i] {
                print(i)
            }
        }
    }
}
