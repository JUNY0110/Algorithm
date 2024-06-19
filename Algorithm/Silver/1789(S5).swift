//
//  1789.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon1789 {
    func run() {
        solution()
    }
    
    // MARK: - 수들의 합(그리디)
    private func solution() {
        let s = Int(readLine()!)!
        var sum = 0
        var i = 1
        
        while sum < s {
            sum += i+1

            i += 1
        }
        
        print(i-1)
    }
}
