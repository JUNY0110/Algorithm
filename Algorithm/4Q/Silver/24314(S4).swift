//
//  24314.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation


final class BaekJoon24314 {
    func run() {
        solution()
    }
    
    private func solution() {
        let aa = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a1 = aa[0], a0 = aa[1]
        let c = Int(readLine()!)!
        let n = Int(readLine()!)!
        
        print(a1 * n + a0 >= c * n && a1 >= c ? 1 : 0)
    }
}
