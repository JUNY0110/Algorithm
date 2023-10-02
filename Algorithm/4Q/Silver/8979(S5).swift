//
//  8979.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/02.
//

import Foundation


final class BaekJoon8979 {
    func run() {
        solution()
    }
    
    struct Olympics: Equatable {
        let countryNumber: Int
        let medals: Medal
        var rank: Int
        
        static func == (lhs: BaekJoon8979.Olympics, rhs: BaekJoon8979.Olympics) -> Bool {
            return lhs.medals == rhs.medals
        }
    }
    
    struct Medal: Equatable {
        let gold: Int
        let silver: Int
        let bronze: Int
    }
    
    private func solution() {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = input[0], k = input[1]
        var scores = [Olympics]()
        
        for _ in 0..<n {
            let country = readLine()!.split(separator: " ").compactMap { Int($0) }
            let countryNumber = country[0]
            let medal = Medal(gold: country[1], silver: country[2], bronze: country[3])
            
            scores.append(Olympics(countryNumber: countryNumber, medals: medal, rank: 0))
        }
        
        scores = sortedScores(scores)
        scores[0].rank = 1
        
        scores = determineRanking(scores)
        
        for score in scores {
            if score.countryNumber == k {
                print(score.rank)
                break
            }
        }
    }
    
    func sortedScores(_ scores: [Olympics]) -> [Olympics] {
        return scores.sorted {
            if $0.medals.gold != $1.medals.gold {
                return $0.medals.gold > $1.medals.gold
            } else if $0.medals.silver != $1.medals.silver  {
                return $0.medals.silver > $1.medals.silver
            }
            return $0.medals.bronze > $1.medals.bronze
        }
    }
    
    func determineRanking(_ scores: [Olympics]) -> [Olympics] {
        var scores = scores
        
        for i in 1..<scores.count {
            if scores[i-1].medals != scores[i].medals {
                scores[i].rank = i+1
            }
            
            if scores[i].medals == scores[i-1].medals {
                scores[i].rank = scores[i-1].rank
            }
        }
        return scores
    }
}
