//
//  2563.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/19.
//

import Foundation

class BaekJoon2563 {
    func run() {
        solution3()
    }
    
    func solution1() {
        let num = Int(readLine()!)!
        var coordinates = [[Int]]()
        
        var x = 0
        var y = 0
        var width = 0
        var height = 0
        
        
        for _ in 0..<num {
            let coordinate = readLine()!.split(separator: " ").map { Int(String($0))! }
            x = coordinate[0]
            y = coordinate[1]
            
            coordinates.append([x, y])
        }
        
        for i in 0..<coordinates.count {
            for j in 0..<coordinates.count {
                if coordinates[i][0] + 10 < coordinates[j][0] + 10 && coordinates[i][0] + 10 > coordinates[j][0] {
                    
                    x = coordinates[j][0]
                    width = coordinates[i][0] + 10 - coordinates[j][0]
                }

                if coordinates[i][1] + 10 < coordinates[j][1] + 10 && coordinates[i][1] + 10 > coordinates[j][1] {
                    
                    y = coordinates[j][1]
                    height = coordinates[j][1] - coordinates[i][1]
                }
            }
        }
        print(num * 100 - (width * height))
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        var coordinates = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        var result = 0
        
        for _ in 0..<num {
            let coordinate = readLine()!.split(separator: " ").map { Int(String($0))! }
            let x = coordinate[0]
            let y = coordinate[1]
            
            for i in 0..<10 {
                for j in 0..<10 {
                    coordinates[y + j][x + i] += 1
                    
                    if coordinates[y + j][x + i] > 1 {
                        coordinates[y + j][x + i] = 1
                        result += 1
                    }
                }
            }
        }
        print(num * 100 - result)
    }
    
    func solution3() {
        let num = Int(readLine()!)!
        var coordinates = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        var result = 0
        
        for _ in 0..<num {
            let coordinate = readLine()!.split(separator: " ").map { Int(String($0))! }
            let x = coordinate[0]
            let y = coordinate[1]
            
            for i in 0..<10 {
                for j in 0..<10 {
//                    if coordinates[y + j][x + i] != 1 {
//                        coordinates[y + j][x + i] = 1
//                        result += 1
//                    }
                    if coordinates[y + j][x + i] == 0 {
                        coordinates[y + j][x + i] = 1
                        result += 1
                    }
                }
            }
        }
        print(result)
    }
}
