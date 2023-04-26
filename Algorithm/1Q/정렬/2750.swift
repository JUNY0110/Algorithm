//
//  2750.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/20.
//

import Foundation

class BaekJoon2750 {
    func run() {
        solution6()
    }
    
    func solution1() {
        let num = Int(readLine()!)!
        var numSet = Set<Int>()
        
        for _ in 0..<num {
            let input = Int(readLine()!)!
            
            numSet.insert(input)
        }
        
        let results: [Int] = numSet.sorted(by: {$0 < $1})
        
        results.forEach {
            print($0)
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        var results = Array<Int>()
        
        for _ in 0..<num {
            let input = Int(readLine()!)!
            
            results.append(input)
        }
        results.sort()
        
        results.forEach {
            print($0)
        }
    }
    
    func solution3() {
        let num = Int(readLine()!)!
        var results = Array<Int>()
        
        for _ in stride(from: 0, to: num, by: 1) {
            let input = Int(readLine()!)!
            
            results.append(input)
        }
        results.sort()
        results.forEach {
            print($0)
        }
    }
    
    func solution4() {
        if let input = readLine(),
           let num = Int(input) {
            var results = Array<Int>()
            
            for _ in stride(from: 0, to: num, by: 1) {
                guard let input = readLine(),
                      let n = Int(input) else { break }
                
                results.append(n)
            }
            results.sort()
            
            results.forEach {
                print($0)
            }
        }
    }
    
    func solution5() {
        var results = Array<Int>()
        
        for _ in 0..<Int(readLine()!)! {
            results.append(Int(readLine()!)!)
        }
        results.sort()
        
        for result in results {
            print(result)
        }
    }
    
    func solution6() {
        if let input = readLine(),
           let num = Int(input) {
            var results = Array<Int>()
            
            for _ in stride(from: 0, to: num, by: 1) {
                guard let input = readLine(),
                      let n = Int(input) else { break }
                
                results.append(n)
            }
            print(results.sorted().map {"\($0)"}.joined(separator: "\n"))
        }
    }
}
