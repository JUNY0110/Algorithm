//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/14.
//

import Foundation

import Foundation

func solution1(_ s:String) -> Int {
    var s = s.split(separator: " ").map { Int($0) }
    var nums = [Int]()
    
    for num in s {
        if let num = num {
            nums.append(num)
            continue
        }
        nums.removeLast()
//        guard num == nil else {
//            nums.append(num!)
//            continue
//        }
//        nums.removeLast()
    }

    return nums.reduce(0, +)
}

func solution2(_ s:String) -> Int {
    var s = s.split(separator: " ").map { Int($0) }
    var nums = [Int]()
    
    print(type(of: s[0]))
    for num in s {
         if num == nil {
             nums.removeLast()
             continue
         }
         nums.append(num!)
    }
    
    return nums.reduce(0, +)
}

func solution3(_ s:String) -> Int {
    var s = s.split(separator: " ").map { String($0) }
    var nums = [Int]()
    
     for word in s {
         if word == "Z" {
             nums.removeLast()
             continue
         }
         nums.append(Int(word)!)
     }
    
    return nums.reduce(0, +)
}

func solution4(_ s:String) -> Int {
    var s = s.split(separator: " ").map { Int($0) }
    var nums = [Int]()
    
    for num in s {
        guard num == nil else {
            nums.append(num!)
            continue
        }
        nums.removeLast()
    }

    return nums.reduce(0, +)
}
