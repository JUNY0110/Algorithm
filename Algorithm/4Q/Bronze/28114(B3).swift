//
//  28114.swift
//  Algorithm
//
//  Created by 지준용 on 10/26/23.
//

import Foundation


final class BaekJoon28114 {
    func run() {
        solution()
    }
    
    private func solution() {
        struct Team {
            let solutionCount: Int
            let grade: Int
            let name: Character
        }
        
        var teams = [Team]()
        var result = ""
        
        for _ in 0..<3 {
            let mate = readLine()!.split(separator: " ").map { String($0) }
            guard let solutionCount = Int(mate[0]) else { continue }
            guard var grade = Int(mate[1]) else { continue }
            guard let name = mate[2].first else { continue }
            grade %= 100
            
            let team = Team(solutionCount: solutionCount, grade: grade, name: name)
            teams.append(team)
        }
        teams.sort(by: {$0.grade < $1.grade})
        
        teams.forEach {
            result += String($0.grade)
        }
        print(result)
        
        result = ""
        
        teams.sort(by: {$0.solutionCount > $1.solutionCount})
        teams.forEach {
            result += String($0.name)
        }
        print(result)
    }
}
