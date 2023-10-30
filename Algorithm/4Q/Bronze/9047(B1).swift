//
//  9047.swift
//  Algorithm
//
//  Created by 지준용 on 10/30/23.
//

import Foundation


final class BaekJoon9047 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            var count = 0
            var n = readLine()!
            
            while n != "6174" {
                let big = String(n.sorted(by: >))
                let small = String(n.sorted(by: <))
                n = String(Int(big)! - Int(small)!)
                
                if n.count < 4 {
                    var temp = ""
                    
                    for _ in 0..<(4 - n.count) {
                        temp += "0"
                    }
                    n += temp
                }
                count += 1
            }
            print(count)
        }
    }
}
