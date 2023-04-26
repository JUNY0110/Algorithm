//
//  25206.swift
//  Algorithm
//
//  Created by 지준용 on 2023/04/26.
//

import Foundation

class BaekJoon25206 {
    func run() {
        solution()
    }
    
    /// - Note: 문제, 학점 평점 구하기(전체 20과목, P이면 포함하지 않음.)
    /// - Important: SUM(과목별 등급 * 과목평점) / SUM(과목별 학점)
    
    func solution() {
        var sum = 0.0
        var gradesCount = 0.0
        
        for _ in 0..<20 {
            let majorGrades = readLine()!.split(separator: " ")
            let score = majorGrades[2]
            
            switch score {
            case "A+":
                sum += Double(majorGrades[1])! * 4.5
                gradesCount += Double(majorGrades[1])!
            case "A0":
                sum += Double(majorGrades[1])! * 4.0
                gradesCount += Double(majorGrades[1])!
            case "B+":
                sum += Double(majorGrades[1])! * 3.5
                gradesCount += Double(majorGrades[1])!
            case "B0":
                sum += Double(majorGrades[1])! * 3.0
                gradesCount += Double(majorGrades[1])!
            case "C+":
                sum += Double(majorGrades[1])! * 2.5
                gradesCount += Double(majorGrades[1])!
            case "C0":
                sum += Double(majorGrades[1])! * 2.0
                gradesCount += Double(majorGrades[1])!
            case "D+":
                sum += Double(majorGrades[1])! * 1.5
                gradesCount += Double(majorGrades[1])!
            case "D0":
                sum += Double(majorGrades[1])! * 1.0
                gradesCount += Double(majorGrades[1])!
            case "F":
                gradesCount += Double(majorGrades[1])!
            default:
                break
            }
        }
        print(round(sum / Double(gradesCount) * pow(10, 6)) / pow(10, 6))
        print(String(format: "%.6f", sum / Double(gradesCount)))
    }
}
