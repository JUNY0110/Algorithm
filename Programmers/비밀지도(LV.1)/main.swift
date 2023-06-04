//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/04.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let n = Int(readLine()!)!
        let arr1 = readLine()!.split(separator: " ").compactMap { Int($0) }
        let arr2 = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution1(n, arr1, arr2))
    }
    
    func solution1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var result = Array(repeating: "", count: n)
        
        for i in 0..<n {
            let (firstMap, secondMap) = translateMap1(of: arr1[i], arr2[i], size: n)
            
            for j in 0..<n {
                result[i] += unionMap1(of: firstMap[j], secondMap[j])
            }
        }
        return result
    }
    
    func translateMap1(of secret1: Int, _ secret2: Int, size: Int) -> ([String], [String]) {
        var firstSecret = String(secret1, radix: 2)
        var secondSecret = String(secret2, radix: 2)

        firstSecret = String(repeating: "0", count: size - firstSecret.count) + firstSecret
        secondSecret = String(repeating: "0", count: size - secondSecret.count) + secondSecret
        
        return (firstSecret.map { String($0) }, secondSecret.map { String($0) })
    }
    
    func unionMap1(of firstLine: String, _ secondLine: String) -> String {
        var unionLine = ""
        
        if firstLine == "1" || secondLine == "1" {
            unionLine += "#"
        } else {
            unionLine += " "
        }
        return unionLine
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var (firstSecret, secondSecret) = ([[String]](), [[String]]())
        (firstSecret, secondSecret) = translateMap2(arr1, arr2, size: n)

        return unionMap2(size: n, of: firstSecret, secondSecret)
    }

    func translateMap2(_ secret1: [Int], _ secret2: [Int], size: Int) -> ([[String]], [[String]]) {
        var firstSecret = Array(repeating: Array(repeating: "0", count: size), count: size)
        var secondSecret = Array(repeating: Array(repeating: "0", count: size), count: size)

        for i in 0..<size {
            let firstMap = String(secret1[i], radix: 2).map { String($0) }
            let secondMap = String(secret2[i], radix: 2).map { String($0) }

            firstSecret[i][size-firstMap.count..<size] = ArraySlice(firstMap)
            secondSecret[i][size-secondMap.count..<size] = ArraySlice(secondMap)
        }

        return (firstSecret, secondSecret)
    }

    func unionMap2(size: Int, of first: [[String]], _ second: [[String]]) -> [String] {
        var unionMap = Array(repeating: Array(repeating: "0", count: size), count: size)
        var result = [String]()

        for i in 0..<size {
            for j in 0..<size {
                if first[i][j] == "1" || second[i][j] == "1" {
                    unionMap[i][j] = "#"
                } else {
                    unionMap[i][j] = " "
                }
            }
            result.append(unionMap[i].joined())
        }
        return result
    }
}
