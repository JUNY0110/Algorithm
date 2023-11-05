//
//  24315.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation


final class BaekJoon24315 {
    func run() {
        solution()
    }
    
    private func solution() {
        let aa = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a1 = aa[0], a0 = aa[1]
        let cc = readLine()!.split(separator: " ").compactMap { Int($0) }
        let c1 = cc[0], c2 = cc[1]
        
        let n = Int(readLine()!)!
        
        let fn = a1 * n + a0
        print((c1 * n)...(c2 * n) ~= fn && (c1...c2) ~= a1 ? 1 : 0)
    }
}
