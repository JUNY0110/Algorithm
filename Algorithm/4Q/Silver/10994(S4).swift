//
//  10994.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation

final class BaekJoon10994 {
    func run() {
        solution2()
    }
    
    private func solution1() {
        let num = Int(readLine()!)!
        let index = 1
        
        print(String(repeating: "*", count: 4*num-3))
        
        if num > 1 {
            downShootingStar(count: num-1, index: index)
            upShootingStar(count: 0, index: num-1)
        }
        
        func downShootingStar(count: Int, index: Int) {
            if count == 0 { return }
            
            for i in 0..<2 {
                print(String(repeating: "* ", count: index), terminator: "")
                print(String(repeating: (i % 2 == 0) ? " " : "*", count: 4*count-3), terminator: "")
                print(String(repeating: " *", count: index))
            }
            return downShootingStar(count: count-1, index: index+1)
        }
        
        func upShootingStar(count: Int, index: Int) {
            if count == num { return }
            
            if count > 0 {
                print(String(repeating: "* ", count: index), terminator: "")
                print(String(repeating: "*", count: 4*count+1), terminator: "")
                print(String(repeating: " *", count: index))
            }
            print(String(repeating: "* ", count: index), terminator: "")
            print(String(repeating: " ", count: 4*count+1), terminator: "")
            print(String(repeating: " *", count: index))
            
            return upShootingStar(count: count+1, index: index-1)
        }
    }
    
    private func solution2() {
        var arr = ["*"]
        for _ in 1..<Int(readLine()!)! {
            var temp = [String]()
            let count = arr[0].count
            let blockA = String(repeating: "*", count: count+4)
            let blockB = "*"+String(repeating: " ", count: count+2)+"*"
            
            temp.append(blockA)
            temp.append(blockB)
            for i in arr {
                temp.append("* \(i) *")
            }
            temp.append(blockB)
            temp.append(blockA)

            arr = temp
        }
        arr.forEach { print($0) }
    }
}
