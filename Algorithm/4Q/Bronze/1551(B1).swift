//
//  1551.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/07.
//

import Foundation


final class BaekJoon1551 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
        let _ = nk[0]
        var k = nk[1]
        
        var a = readLine()!.split(separator: ",").compactMap { Int($0) }
        
        while k > 0 {
            var temp = [Int]()
            
            for i in 0..<a.count-1 {
                temp.append(a[i+1] - a[i])
            }
            
            a = temp
            k -= 1
        }
        
        print(a.map { String($0) }.joined(separator: ","))
    }
}
