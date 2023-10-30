//
//  2693.swift
//  Algorithm
//
//  Created by 지준용 on 10/28/23.
//

import Foundation


final class BaekJoon2693 {
    func run() {
        solution()
    }
    
    private func solution() {
        let t = Int(readLine()!)!
        let n = 2
        
        for _ in 0..<t {
            var a = readLine()!.split(separator: " ").compactMap { Int($0) }
            a.sort(by: >)
            
            print(a[n])
        }
    }
}
