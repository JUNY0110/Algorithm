//
//  10250.swift
//  Algorithm
//
//  Created by 지준용 on 2023/01/06.
//

import Foundation

class BaekJoon10250 {
    func run() {
        solution1()
    }
    
    func solution1() {
        for _ in 0..<Int(readLine()!)! {
            let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
            let h = conditions[0]
            let n = conditions[2]
            var result = ""
            
            result += (n % h == 0 ? "\(h)" : "\(n % h)")
            result += (Int(ceil(Double(n) / Double(h))) < 10 ?
                       "0\(Int(ceil(Double(n) / Double(h))))" : "\(Int(ceil(Double(n) / Double(h))))")
            print(result)
        }
    }
    
    func solution2() {
        let num = Int(readLine()!)!
        
        for _ in 0..<num {
            let conditions = readLine()!.split(separator: " ").map { Int(String($0))! }
            let h = conditions[0]
            let n = conditions[2]
            var result = ""

            if n % h == 0 {
                result += String(h)
            } else {
                result = String(n % h)
            }
            if Int(ceil(Double(n) / Double(h))) < 10 {
                result += "0" + String((Int(ceil(Double(n) / Double(h)))))
            } else {
                result += String((Int(ceil(Double(n) / Double(h)))))
            }
            print(result)
        }
    }
    
}
