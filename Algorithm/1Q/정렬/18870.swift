//
//  18870.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/22.
//

//import Foundation

class BaekJoon18870 {
    func run() {
        solution2()
    }

    func solution1() {
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var numDict = [Int: Int]()
        var results = [Int]()

        let sortedNum = nums.sorted(by: <)

        for i in 0..<n {
            if !numDict.values.contains(sortedNum[i]) {
                numDict[numDict.count] = sortedNum[i]
            }
        }

        for i in 0..<n {
            for j in 0..<numDict.count {
                if numDict[j] == nums[i] {
                    results.append(j)
                }
            }
        }

        print(results.map{"\($0)"}.joined(separator: " "))
    }
    
    func solution2() {
        let _ = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
        var numDict = [Int: Int]()
        var value = 0
        
        for i in nums.sorted() {
            if numDict[i] == nil {
                numDict[i] = value
                value += 1
            }
        }
        print(nums.map{"\(numDict[$0]!)"}.joined(separator: " "))
    }
    
    func solution3() {
        let n = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.enumerated().sorted{$0.element < $1.element}
        var ans = Array(repeating: 0, count: n)

        var rank = 0
        var previous = arr.first!.element

        ans[arr.first!.offset] = rank

        for (idx, value) in arr[1...] {
            if previous == value {
                ans[idx] = rank
            } else {
                rank += 1
                ans[idx] = rank
            }
            previous = value
        }

        print(ans.map{String($0)}.joined(separator: " "))
    }
}
