//
//  9946.swift
//  Algorithm
//
//  Created by 지준용 on 10/30/23.
//

import Foundation


final class BaekJoon9946 {
    func run() {
        solution()
    }
    
    private func solution() {
        var count = 0
        
        while let input = readLine(), input != "END",
                let pick = readLine() {
            
            count += 1
            
            if Dictionary(grouping: input, by: { $0 }) == Dictionary(grouping: pick, by: { $0 }) {
                print("Case \(count): same")
            } else {
                print("Case \(count): different")
            }
        }
    }
}
