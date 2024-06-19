//
//  2864.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon2864 {
    func run() {
        solution()
    }
    
    // MARK: - 5와 6의 차이(그리디)
    private func solution() {
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
        var a = nums[0]
        var b = nums[1]

        var minA = ""
        var maxA = ""
        var minB = ""
        var maxB = ""
        
        while a > 0 {
            let tempA = a % 10
            
            if tempA == 5 {
                maxA += "6"
                minA += "5"
            } else if tempA == 6 {
                maxA += "6"
                minA += "5"
            } else {
                minA += String(tempA)
                maxA += String(tempA)
            }
            
            a = a / 10
        }
        
        while b > 0 {
            let tempB = b % 10
            
            if tempB == 5 {
                minB += "5"
                maxB += "6"
            } else if tempB == 6 {
                minB += "5"
                maxB += "6"
            } else {
                minB += String(tempB)
                maxB += String(tempB)
            }
            
            b = b / 10
        }
        
        
        minA = String(minA.reversed())
        maxA = String(maxA.reversed())
        
        minB = String(minB.reversed())
        maxB = String(maxB.reversed())
        
        print(Int(minA)! + Int(minB)!, Int(maxA)! + Int(maxB)!)
    }
    
    
    private func solution2() {
        let nums = readLine()!.split(separator: " ").map { String($0) }
        let a = nums[0]
        let b = nums[1]
        
        let minA = a.replacingOccurrences(of: "6", with: "5")
        let minB = b.replacingOccurrences(of: "6", with: "5")
        
        let maxA = a.replacingOccurrences(of: "5", with: "6")
        let maxB = b.replacingOccurrences(of: "5", with: "6")
        
        print(Int(minA)! + Int(minB)!, Int(maxA)! + Int(maxB)!)
    }
}
