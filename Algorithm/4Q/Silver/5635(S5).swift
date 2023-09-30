//
//  5635.swift
//  Algorithm
//
//  Created by 지준용 on 2023/09/30.
//

import Foundation

class BaekJoon5635 {
    func run() {
        solution()
    }

    struct Student {
        let name: String
        let birth: (day: Int, month: Int, year: Int)
    }
    
    private func solution() {
        let number = Int(readLine()!)!
        var students = [Student]()
        
        addStudent()
        students = sortedStudent()
        
        if let youngest = students.last?.name,
           let oldest = students.first?.name {
            print(youngest)
            print(oldest)
        }
        
        func addStudent() {
            for _ in 0..<number {
                let studentInfo = readLine()!.split(separator: " ").map { String($0) }
                let name = studentInfo[0]
                let birth = (day: Int(studentInfo[1])!,
                             month: Int(studentInfo[2])!,
                             year: Int(studentInfo[3])!)
                students.append(Student(name: name, birth: birth))
            }
        }
        
        func sortedStudent() -> [Student] {
            return students.sorted {
                if $0.birth.year != $1.birth.year {
                    return $0.birth.year < $1.birth.year
                }
                if $0.birth.month != $1.birth.month {
                    return $0.birth.month < $1.birth.month
                }
                return $0.birth.day < $1.birth.day
            }
        }
    }
}
