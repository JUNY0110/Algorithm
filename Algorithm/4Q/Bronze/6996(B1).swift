//
//  6996.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/02.
//

import Foundation


final class BaekJoon6996 {
    func run() {
        solution()
    }
    
    private func solution() {
        let testCase = Int(readLine()!)!
        
        for _ in 0..<testCase {
            let words = readLine()!.split(separator: " ").map { String($0) }
            let a = words[0].map { String($0) }
            let b = words[1].map { String($0) }
            var temp = a
            
            if a.endIndex == b.endIndex {
                for i in 0..<b.count {
                    guard let index = temp.firstIndex(of: b[i]) else { break }
                    
                    temp.remove(at: index)
                }
            }
            
            print("\(a.joined()) & \(b.joined()) are " + (temp.isEmpty ? "anagrams." : "NOT anagrams."))
        }
    }
}
