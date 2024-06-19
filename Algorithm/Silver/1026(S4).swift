//
//  1026.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon1026 {
    func run() {
        solution()
    }
    
    // MARK: - 보물(그리디)
    private func solution() {
        let n = Int(readLine()!)!
        // s = a[0]*b[0] + ... + a[n-1]*b[n-1]
        var a = readLine()!.split(separator: " ").compactMap { Int($0) } // a를 재배열해서 s를 최소값으로 만들기.
        var b = readLine()!.split(separator: " ").compactMap { Int($0) } // b는 재배열하면 안 됨.
        
        a.sort()
        b.sort(by: >)
        
        var result = 0
        
        for i in 0..<n {
            result += a[i]*b[i]
        }
        
        print(result)
    }
}
