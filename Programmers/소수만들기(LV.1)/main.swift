//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/27.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(nums))
    }
    
    func solution(_ nums:[Int]) -> Int {
        var answer = 0
        var results = [Int]()

        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for k in j+1..<nums.count {
                    var sum = nums[i] + nums[j] + nums[k]
                    results.append(sum)
                }
            }
        }
        for i in 0..<results.count {
            if isPrimeNumber(results[i]) {
                print(results[i])
                answer += 1
            }
        }

        return answer
    }

    func isPrimeNumber(_ num: Int) -> Bool {
        if num < 2 { return false }
        if num == 2 || num == 3 { return true }
        
        var i = 2
        var isPrime = true
        
        while i * i <= num {
            if num % i == 0 {
                isPrime = false
                break
            }
            i += 1
        }
        return isPrime
    }
}
