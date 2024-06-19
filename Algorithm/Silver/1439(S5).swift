//
//  1439.swift
//  Algorithm
//
//  Created by 지준용 on 6/19/24.
//

import Foundation


final class BaekJoon1439 {
    func run() {
        solution()
    }
    
    // MARK: - 뒤집기(그리디)
    private func solution() {
        let s = readLine()!
        
        let left = s.split(separator: "1").count
        let right = s.split(separator: "0").count
        
        print(min(left, right))
    }
}
