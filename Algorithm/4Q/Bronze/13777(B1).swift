//
//  13777.swift
//  Algorithm
//
//  Created by 지준용 on 10/15/23.
//

import Foundation

final class BaekJoon13777 {
    func run() {
        solution()
    }
    
    private func solution() {
        while let input = readLine(),
              let num = Int(input), num != 0 {
            
            var result = [Int]()
            result = binarySearch(find: num, from: 1, to: 50, result)
            
            print(result.map { String($0) }.joined(separator: " "))
        }
        
        
        func binarySearch(find number: Int, from left: Int, to right: Int, _ result: [Int]) -> [Int] {
            let middle = (left + right) / 2
            
            if number < middle {
                return binarySearch(find: number, from: left, to: middle-1, result + [middle])
            } else if number > middle {
                return binarySearch(find: number, from: middle+1, to: right, result + [middle])
            }
            return result + [middle]
        }
    }
}
