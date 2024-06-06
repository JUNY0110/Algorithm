//
//  2729.swift
//  Algorithm
//
//  Created by 지준용 on 6/6/24.
//

import Foundation


final class BaekJoon2729 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        
        for _ in 0..<n {
            let nums = readLine()!.split(separator: " ").map{String($0)}
            var left = nums[0]
            var right = nums[1]
            let maxCount = max(left.count, right.count) // 최대길이 찾기
            left = String(repeating: "0", count: (maxCount - left.count)) + left
            right = String(repeating: "0", count: (maxCount - right.count)) + right
            
            let leftMap = left.reversed().map{String($0)}
            let rightMap = right.reversed().map{String($0)}
            var temp = 0
            var result = ""
            
            for i in 0..<maxCount {
                guard let leftNum = Int(leftMap[i]) else {continue}
                guard let rightNum = Int(rightMap[i]) else {continue}
                let sum = leftNum+rightNum+temp
                
                if sum == 3 {
                    temp = 1
                    result += "1"
                    continue
                }
                
                if sum == 2 {
                    temp = 1
                    result += "0"
                    continue
                }
                
                if sum == 1 {
                    temp = 0
                    result += "1"
                    continue
                }
                
                if sum == 0 {
                    temp = 0
                    result += "0"
                }
            }
            
            if temp == 1 {
                result += "\(temp)"
            }
            result = String(result.reversed())
            var resultMap = result.map{String($0)}
            
            let index = resultMap.firstIndex(of: "1") ?? resultMap.endIndex-1
            resultMap = resultMap[index...].map { String($0) }
            result = resultMap.joined()
            
            print(result)
        }
    }
}
