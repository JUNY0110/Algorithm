//
//  1417.swift
//  Algorithm
//
//  Created by 지준용 on 10/24/23.
//

import Foundation


final class BaekJoon1417 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var voters = [Int]()
        
        for _ in 0..<n {
            let voter = Int(readLine()!)!
            voters.append(voter)
        }
        
        var result = 0

        while true {
            guard let maxVote = voters[1..<n].max() else { break }
            if voters[0] > maxVote { break }
            guard let index = voters.lastIndex(of: maxVote) else { continue }
            guard index != 0 else { break }
            
            voters[index] -= 1
            voters[0] += 1
            result += 1
        }
        print(result)
    }
}
