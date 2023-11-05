//
//  16466.swift
//  Algorithm
//
//  Created by 지준용 on 10/31/23.
//

import Foundation


final class BaekJoon16466 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
        var tickets = Array(repeating: 0, count: nums.max()!+1)
        
        for num in nums {
            tickets[num] = num
        }
        
        print(tickets[1...].firstIndex(of: 0) ?? n+1)
    }
}
