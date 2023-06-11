//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/11.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let k = Int(readLine()!)!
        let score = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(k, score))
    }

    func solution(_ k:Int, _ score:[Int]) -> [Int] {
        var bestScores = [Int]()
        var results = [Int]()
        
        for s in score {
            bestScores.append(s)
            bestScores.sort(by: >)
            
            if bestScores.count > k {
                bestScores.removeLast()
            }
            results.append(bestScores.last!)
        }
        
        return results
    }
}
