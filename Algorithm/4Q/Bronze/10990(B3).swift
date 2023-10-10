//
//  10990.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon10990 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        
        for i in 1...num {
            print(String(repeating: " ", count: num-i), terminator: "")
            print("*", terminator: "")
            
            if i > 1 {
                print(String(repeating: " ", count: (2 * i) - 3), terminator: "")
                print("*")
            } else {
                print()
            }
        }
    }
}
