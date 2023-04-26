//
//  5597.swift
//  Algorithm
//
//  Created by 지준용 on 2022/12/26.
//

import Foundation

// MARK: - 풀이 1
var studentNum = Array(1...30)
var submittedStudents = Set<Int>()

for _ in 0..<5 {
    if let submittedStudent = Int(readLine()!) {
        submittedStudents.insert(submittedStudent)
    }
}

studentNum.forEach {
    if !submittedStudents.contains($0) {
        print($0)
    }
}

// MARK: - 풀이 2 (입력된 배열값을 0으로 치환)
for _ in 0..<28 {
    studentNum[Int(readLine()!)! - 1] = 0
}
studentNum.forEach {
    if $0 != 0 {
        print($0)
    }
}
