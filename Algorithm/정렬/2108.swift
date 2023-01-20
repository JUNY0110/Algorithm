//
//  2108.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/20.
//

import Foundation

class BaekJoon2108 {
    func run() {
        solution1()
    }
    
    func solution1() {
        let n = Int(readLine()!)!
        var nums = [Int]()
        var sum = 0
        var numDic = [Int:Int]()
        
        for i in 0..<n {
            nums.append(Int(readLine()!)!)
            sum += nums[i]
            numDic[nums[i], default: 0] += 1
        }
        nums.sort()
        
        // 평균값
        print(Int(round(Double(sum) / Double(n))))
        
        // 중앙값
        print(nums[nums.count / 2])
        
        // 최빈값(최빈값이 여러개면 최빈값 중 2번째로 작은 값)
        if numDic.filter ({ $0.value == numDic.values.max()! }) .count == 1 {
            print(numDic.filter{$0.value == numDic.values.max()!}.sorted(by: <)[0].key)
        } else {
            print(numDic.filter{$0.value == numDic.values.max()!}.sorted(by: <)[1].key)
        }
        
        // 범위(최대값 - 최소값)
        print(nums.max()! - nums.min()!)
    }
    
    func solution2() {
        let n = Int(readLine()!)!
        var nums = [Int]()
        var sum = 0
        var numDic = [Int:Int]()
        
        for i in 0..<n {
            nums.append(Int(readLine()!)!)
            sum += nums[i]
            numDic[nums[i], default: 0] += 1
        }
        nums.sort()
        
        // 평균값
        print(Int(round(Double(sum) / Double(n))))
        
        // 중앙값
        print(nums[nums.count / 2])
        
        // 최빈값(최빈값이 여러개면 최빈값 중 2번째로 작은 값)
        let mode = numDic.filter{$0.value == numDic.values.max()!}.keys.sorted()
        print(mode.count == 1 ? mode[0] : mode[1])
        
        // 범위(최대값 - 최소값)
        print(nums.max()! - nums.min()!)
    }
}
