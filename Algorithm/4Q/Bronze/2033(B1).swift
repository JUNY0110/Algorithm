//
//  2033.swift
//  Algorithm
//
//  Created by 지준용 on 10/16/23.
//

import Foundation


final class BaekJoon2033 {
    func run() {
        solution()
    }
    
    private func solution() {
        var num = Int(readLine()!)!
        var result = ""
        
        while num / 10 > 0 {
            result += "0"
            
            if num % 10 >= 5 {
                num = num / 10 + 1
            } else {
                num = num / 10
            }
        }
        print(String(num) + result)
    }
}
