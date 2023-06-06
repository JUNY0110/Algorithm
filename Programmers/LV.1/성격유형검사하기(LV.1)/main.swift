//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/06.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let survey = readLine()!.split(separator: " ").map { String($0) }
        let choices = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(solution(survey, choices))
    }
    
    func solution(_ survey:[String], _ choices:[Int]) -> String {
        let testerScore = calculateScore(of: choices, at: survey)
        
        return surveyResult(of: testerScore)
    }

    func calculateScore(of choices:[Int], at survey:[String]) -> [Character: Int] {
        var indicators: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0,
                                            "A": 0, "N": 0, "J": 0, "M": 0]
        
        for (question, choice) in zip(survey, choices) {
            switch choice {
            case 1..<4: indicators[question.first!]! += (4 - choice) // 첫번째 지표
            case 5...7: indicators[question.last!]! += (choice - 4)  // 두번째 지표
            default: break
            }
        }

        return indicators
    }
    
    func surveyResult(of indicatorScores: [Character: Int]) -> String {
        let indicatorTypes: [(Character, Character)] = [("R", "T"), ("C", "F"),
                                                        ("J", "M"), ("A", "N")]
        var result = ""
        
        for t in indicatorTypes {
            result += String((indicatorScores[t.0]! >= indicatorScores[t.1]!) ? t.0 : t.1) // 지표 점수 계산
        }
        
        return result
    }
}
