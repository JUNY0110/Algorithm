//
//  2331.swift
//  Algorithm
//
//  Created by 지준용 on 11/10/23.
//

import Foundation


final class BaekJoon2331 {
    func run() {
        solution()
    }
    
    private func solution() {
        let ap = readLine()!.split(separator: " ").compactMap { Int($0) }
        var a = ap[0]
        let p = ap[1]
        var result = [a]
        
        while true {
            let temp = String(a).map { Double(String($0))! }
            var sum = 0
            
            temp.forEach {
                sum += Int(pow($0, Double(p)))
            }
            
            if let firstIndex = result.firstIndex(of: sum) {
                print(firstIndex)
                break
            }
            
            result.append(sum)
            a = sum
        }
    }
}
