//
//  1235.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon11536 {
    func run() {
        solution()
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        var names = [String]()
        
        for _ in 0..<number {
            let name = readLine()!
            names.append(name)
        }
        
        switch names {
        case names.sorted(by: <): print("INCREASING")
        case names.sorted(by: >): print("DECREASING")
        default: print("NEITHER")
        }
    }
}
