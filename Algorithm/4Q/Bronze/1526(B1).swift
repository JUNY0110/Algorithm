//
//  1526.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/01.
//

import Foundation


final class BaekJoon1526 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        
        for value in stride(from: n, through: 4, by: -1) {
            let temp = String(value).map { v -> String in
                if v == "7" || v == "4" {
                    return String(v)
                }
                return ""
            }
            
            if String(value) == temp.joined() {
                print(value)
                break
            }
        }
    }
}
