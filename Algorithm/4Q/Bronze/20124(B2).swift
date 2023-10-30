//
//  20124.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon20124 {
    func run() {
        solution()
    }
    
    private func solution() {
        struct Candidate {
            let name: String
            let vote: Int
        }
        
        let n = Int(readLine()!)!
        var candidates = [Candidate]()
        
        for _ in 0..<n {
            let candidateInfo = readLine()!.split(separator: " ").map { String($0) }
            let name = candidateInfo[0]
            guard let vote = Int(candidateInfo[1]) else { return }
            
            let candidate = Candidate(name: name, vote: vote)
            candidates.append(candidate)
        }
        
        candidates.sort(by: {
            if $0.vote == $1.vote {
                return $0.name < $1.name
            }
            return $0.vote > $1.vote
        })
        print(candidates[0].name)
    }
}
