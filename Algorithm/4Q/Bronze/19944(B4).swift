//
//  19944.swift
//  Algorithm
//
//  Created by 지준용 on 10/11/23.
//

import Foundation


final class BaekJoon19944 {
    func run() {
        solution()
    }
    
    private func solution() {
        let grades = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = grades[0], m = grades[1]
        
        switch m {
        case 1...2: print("NEWBIE!")
        case ...n: print("OLDBIE!")
        default: print("TLE!")
        }
    }
}
