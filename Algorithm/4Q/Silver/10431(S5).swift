//
//  10431.swift
//  Algorithm
//
//  Created by 지준용 on 2023/10/10.
//

import Foundation


final class BaekJoon10431 {
    func run() {
        solution()
    }
    
    private func solution() {
        let num = Int(readLine()!)!
        var result = [Int]()
        
        for i in 1...num {
            let testCase = readLine()!.split(separator: " ").compactMap { Int($0) }
            var students = Array(testCase[1...])
            var count = 0

            for j in 1..<students.count {
                guard let index = students[0..<j].firstIndex(where: {$0 > students[j]}) else { continue }
                let student = students.remove(at: j)
                students.insert(student, at: index)
                count += students[index..<j].count
            }
            
            print(i, count)
        }
    }
}
