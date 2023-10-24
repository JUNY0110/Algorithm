//
//  2606.swift
//  Algorithm
//
//  Created by 지준용 on 10/22/23.
//

import Foundation


final class BaekJoon2606 {
    func run() {
        solution()
    }
    
    private func solution() {
        let computerCount = Int(readLine()!)!
        let pairCount = Int(readLine()!)!
        var linkedComputer = [Int: [Int]]()
        
        for _ in 0..<pairCount {
            let linked = readLine()!.split(separator: " ").compactMap { Int($0) }
            let start = linked[0], end = linked[1]
            linkedComputer[start, default: []].append(end)
            linkedComputer[end, default: []].append(start)
        }
        
        var isInfected = Array(repeating: false, count: computerCount+1)
        
        dfs(1)
        
        print(isInfected.filter{$0 == true}.count-1)
        
        func dfs(_ index: Int) {
            if isInfected[index] { return }
            
            isInfected[index] = true
            
            guard let computers = linkedComputer[index] else { return }
            
            for computer in computers {
                dfs(computer)
            }
        }
    }
}
