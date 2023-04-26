//
//  2851.swift
//  Algorithm
//
//  Created by 지준용 on 2023/02/13.
//

import Foundation

class BaekJoon2851 {
    func run() {
        solution1()
    }
    
    func solution1() {
        var scores = [Int]()
        var sum = 0
        var underSum = 0
        var aboveSum = 0
        
        for _ in 1...10 { scores.append(Int(readLine()!)!) }
        
        for score in scores {
            sum += score

            if sum == 100 { break }
            
            if sum < 100 {
                underSum = sum
            } else {
                aboveSum = sum
                break
            }
        }

        if sum == 100 {
            print(sum)
        } else if 100 - underSum < abs(aboveSum - 100) {
            print(underSum)
        } else {
            print(aboveSum)
        }
    }
    
    func solution2() {
        var answer = 0
        var prevSum = 0

        for _ in 1...10 {
            let num = Int(readLine()!)!
            let currSum = prevSum + num
            if abs(currSum - 100) <= abs(prevSum - 100) { answer = currSum }
            else { break }
            
            prevSum = currSum
        }

        print(answer)
    }
}
