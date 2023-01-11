//
//  2738.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/10.
//

import Foundation

class BaekJoon2738 {
    func run() {
        solution2()
    }
    
    func solution1() {
        if let input = readLine() {
            let conditions = input.split(separator: " ").map { Int(String($0))! }
            let n = conditions[0]
            let m = conditions[1]
            var arrayN: [[Int]] = []
            var arrayM: [[Int]] = []
            
            for i in 0..<2 {
                for _ in 0..<n {
                    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
                    i == 0 ? arrayN.append(input) : arrayM.append(input)
                }
            }
            
            for i in 0..<n {
                var results: [Int] = []
                for j in 0..<m {
                    results.append(arrayN[i][j] + arrayM[i][j])
                    print(results[j], terminator: " ")
                }
                print()
            }
        }
    }
    
    func solution2() {
        if let input = readLine() {
            let conditions = input.split(separator: " ").map { Int(String($0))! }
            let n = conditions[0]
            let m = conditions[1]
            var arrayN: [[Int]] = []
            var arrayM: [[Int]] = []
            var results = ""
            
            for i in 0..<2 {
                for _ in 0..<n {
                    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
                    i == 0 ? arrayN.append(input) : arrayM.append(input)
                }
            }
            
            for i in 0..<n {
                for j in 0..<m {
                    results += "\(arrayN[i][j] + arrayM[i][j]) "
                }
                results += "\n"
            }
            print(results)
        }
    }
}
