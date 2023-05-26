//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/25.
//

import Foundation



func solution1(_ numbers:String) -> Int {
    let cNumbers = numbers.sorted(by: >).map{String($0)}.joined()
    var primeNumbers = [[String]]()
    var result = 0
    
    for num in 2...(Int(cNumbers) ?? 2) {
        if checkPrimeNumber(of: num) {
            primeNumbers.append(String(num).map{String($0)})
        }
    }
    
    for prime in primeNumbers {
        var p = prime
        var numbers = cNumbers.map{String($0)}
        
        OutLoop: for i in 0..<numbers.count {
            for j in 0..<p.count {
                if p[j] == numbers[i] {
                    p[j] = ""
                    numbers[i] = ""
                    continue OutLoop
                }
            }
        }
        if p.joined() == "" {
            result += 1
        }
    }
    print(result)
    
    return result
}

func checkPrimeNumber(of num: Int) -> Bool {
    if num == 2 || num == 3 { return true }

    var isPrime = true
    var i = 2
    
    while i * i <= num {
        if num % i == 0 {
            isPrime = false
            break
        }
        i += 1
    }
    
    return isPrime
}


func solution2(_ numbers:String) -> Int {
    let nums = numbers.map { String($0) }
    var visited = [Bool]()
    var numSet = Set<Int>()
    
    func permutaion(_ numArr: [String], count: Int, rCount: Int) {
        if count == rCount {
            numSet.insert(Int(numArr.joined())!)
            print(visited)
            print()
            return
        }
        
        for (idx, value) in nums.enumerated() {
            if visited[idx] {
                continue
            }
            
            var newNumArr = numArr
            newNumArr.append(value)
            print(value)
            visited[idx] = true
            
            permutaion(newNumArr, count: count + 1, rCount: rCount)
            
            visited[idx] = false
        }
    }
    
    for i in 1...nums.count {
        visited = Array(repeating: false, count: nums.count)
        permutaion([], count: 0, rCount: i)
    }
    return numSet.filter { isPrime(num: $0) }.count
}


func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    } else {
        var isPrime = true
        var i = 2
        
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
