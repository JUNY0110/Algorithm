//
//  2535.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon2535 {
    func run() {
        solution()
    }
    
    struct Student {
        let country: Int
        let number: Int
        let score: Int
    }
    
    private func solution() {
        let numbers = Int(readLine()!)!
        var students = [Student]()
        
        for _ in 0..<numbers {
            let studentInfo = readLine()!.split(separator: " ").compactMap { Int($0) }
            let country = studentInfo[0], number = studentInfo[1], score = studentInfo[2]
            
            students.append(Student(country: country, number: number, score: score))
        }
        
        students.sort {
            $0.score > $1.score
        }
        
        var result = [Student]()
        
        for student in students {
            if result.filter({$0.country == student.country}).count < 2 {
                result.append(student)
            }
            
            if result.count == 3 {
                break
            }
        }
        
        result.forEach {
            print($0.country, $0.number)
        }
    }
}
