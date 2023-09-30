//
//  1652.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation

class BaekJoon1652 {
    func run() {
        solution2()
    }

    private func solution1() {
        let n = Int(readLine()!)!
        var room = [[String]]()
        
        for _ in 0..<n {
            let input = readLine()!.map { String($0) }
            room.append(input)
        }

        var horizontalCount = 0
        var horizontalResult = 0
        
        var verticalCount = 0
        var verticalResult = 0
        
        for i in 0..<n {
            for j in 0..<n {
                calculateCount(room[i][j], &horizontalCount)
                calculateCount(room[j][i], &verticalCount)
                
                if room[i][j] == "X" {
                    calculateResult(&horizontalCount, &horizontalResult)
                }
                
                if room[j][i] == "X" {
                    calculateResult(&verticalCount, &verticalResult)
                }
            }
            
            calculateResult(&horizontalCount, &horizontalResult)
            calculateResult(&verticalCount, &verticalResult)
        }
        
        print(horizontalResult, verticalResult)
        
        func calculateCount(_ space: String, _ count: inout Int) {
            if space == "." {
                count += 1
            }
        }
        
        func calculateResult(_ count: inout Int, _ result: inout Int) {
            if count >= 2 {
                result += 1
            }
            count = 0
        }
    }
    
    private func solution2() {
        let n = Int(readLine()!)!
        var arr = [[Bool]](), x = 0, y = 0
        
        for _ in 0..<n {
            let input = readLine()!.map{$0 == "." ? true : false}
            arr.append(input)
        }
        
        for i in 0..<n {
            let splitX = arr[i].split(separator: false).map{$0.count}
            let splitY = arr.map{$0[i]}.split(separator: false).map{$0.count}
            
            for xCount in splitX where xCount >= 2 {
                x += 1
            }
            
            for yCount in splitY where yCount >= 2 {
                y += 1
            }
        }
        
        print(x, y)
    }
}
