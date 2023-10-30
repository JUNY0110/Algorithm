//
//  10989.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon10989 {
    func run() {
//        solution2()
        print(mergeSort([1, 4, 3, 2, 5, 6, 10]))
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 { return array }
        let center = array.count / 2
        let left = Array(array[0..<center])
        let right = Array(array[center..<array.count])
        
        func merge(_ left: [Int],_ right: [Int]) -> [Int] {
            var left = left
            var right = right
            var result: [Int] = []
            
            while !left.isEmpty && !right.isEmpty {
                if left[0] < right[0] {
                    result.append(left.removeFirst())
                } else {
                    result.append(right.removeFirst())
                }
            }
            
            // 왼쪽 배열의 요소가 남은 경우
            if !left.isEmpty {
                result.append(contentsOf: left)
            }
            
            // 오른쪽 배열의 요소가 남은 경우
            if !right.isEmpty {
                result.append(contentsOf: right)
            }
            
            return result
        }
        
        return merge(mergeSort(left), mergeSort(right))
    }
    
    
    private func solution1() {
        let n = Int(readLine()!)!
        var nums = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            let num = Int(readLine()!)!
            nums[i] = num
        }
        
        let numDict = Dictionary(grouping: nums) {$0}.sorted(by: {$0.key > $1.key})
        
        var result = [Int]()
        for i in 0..<numDict.count {
            result.append(numDict[i].key)
        }
        
        result.forEach {
            print($0)
        }
    }
    
    private func solution2() { // O(n + k)
        let n = Int(readLine()!)!
        var nums = Array(repeating: 0, count: 10001)
        
        for _ in 0..<n {
            let num = Int(readLine()!)!
            nums[num] += 1
        }
        
        var result = ""
        
        if let index = nums.lastIndex(where: {$0 > 0}) {
            for i in 1...index {
                result += String(repeating: "\(i)\n", count: nums[i])
            }
        }
        
        print(result)
    }
}
