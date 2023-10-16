//
//  13015.swift
//  Algorithm
//
//  Created by 지준용 on 10/16/23.
//

import Foundation


final class BaekJoon13015 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            if i == 1 {
                print(String(repeating: "*", count: num), terminator: "")
                print(String(repeating: " ", count: 2*num-3), terminator: "")
                print(String(repeating: "*", count: num))
                continue
            }
            
            print(String(repeating: " ", count: i-1), terminator: "")
            print("*", terminator: "")
            print(String(repeating: " ", count: num-2), terminator: "")
            
            if i == num {
                print("*", terminator: "")
            } else {
                print("*", terminator: "")
                print(String(repeating: " ", count: 2*num-2*i-1), terminator: "")
                print("*", terminator: "")
            }
            
            print(String(repeating: " ", count: num-2), terminator: "")
            print("*")
        }
        
        for i in stride(from: num, to: 1, by: -1) {
            if i == 2 {
                print(String(repeating: "*", count: num), terminator: "")
                print(String(repeating: " ", count: 2*num-3), terminator: "")
                print(String(repeating: "*", count: num))
                continue
            }
            print(String(repeating: " ", count: i-2), terminator: "")
            print("*", terminator: "")
            print(String(repeating: " ", count: num-2), terminator: "")
            print("*", terminator: "")
            print(String(repeating: " ", count: 2 * (num-i) + 1), terminator: "")
            print("*", terminator: "")
            print(String(repeating: " ", count: num-2), terminator: "")
            print("*")
        }
    }
}
