//
//  1748.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/27.
//

import Foundation

class BaekJoon1748 {
    func run() {
        solution2()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        var result = 0
        var comparison = 1
        var index = 1
        
        for num in 1...9 {
            if (comparison..<comparison * 10) ~= number {
                result += (number - comparison + 1) * num
                break
            }
            
            result += 9 * comparison * num
            comparison *= 10
        }
        
        print(result)
        /*
         1 ~ 9 = 1 * 9
         10 ~ 99 = 2 * 90
         100 ~ 999 = 3 * 900
         1000 ~ 9999 = 4 * 9000
         ...
         ...
         10000000 ~ 99999999 = 8 * 90000000
         100000000 = 9 * 1
         */
    }
    
    private func solution2() {
        let number = Int(readLine()!)!

        var index = 1
        var result = 0

        while index <= number {
            result += (number-index) + 1
            index *= 10
            print(result)
        }

        print(result)
    }
}
