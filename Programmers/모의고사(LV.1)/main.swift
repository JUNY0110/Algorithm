//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/05/25.
//

import Foundation

let main = Main()
main.run()

class Main {
    func run() {
        let answers = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        print(solution2(answers))
    }
    
    /// - NOTE: 문제풀이.  모의고사
    /// - IMPORTANT: 가장 많은 문제를 맞춘 수포자(중복 포함) 찾기
    
    // 메모리: 17,408kb , 시간: 2.85ms
    func solution1(_ answers:[Int]) -> [Int] {
        // 수포자들이 문제를 찍는 번호 순서
        let first = [1, 2, 3, 4, 5] // index % 5
        let second = [2, 1, 2, 3, 2, 4, 2, 5] // index % 8
        let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
        
        // 반복할 때마다 매번 count해야하는 것 방지
        let firstCnt = first.count
        let secondCnt = second.count
        let thirdCnt = third.count
        
        var scores = [1: 0, 2: 0, 3: 0]
        
        // 문제수만큼 반복
        for i in 0..<answers.count {
            // 수포자별 찍는 배열 반복하기
            // 정답과 일치할 때 +1
            if answers[i] == first[i % firstCnt] {
                scores[1]! += 1
            }
            if answers[i] == second[i % secondCnt] {
                scores[2]! += 1
            }
            if answers[i] == third[i % thirdCnt] {
                scores[3]! += 1
            }
        }
        // 정답 갯수가 배열 전체 최댓값과 일치하는 수포자 명단
        // 수포자 명단을 오름차순으로 정렬
        return scores.filter { $0.value == scores.values.max() ?? 0 }.keys.sorted()
    }
    
    // 메모리: 17,408kb , 시간: 5.98ms
    func solution2(_ answers:[Int]) -> [Int] {
        
        // 수포자들이 문제를 찍는 번호 순서
        let students = (
            first: [1, 2, 3, 4, 5],                       // index % 5
            second: [2, 1, 2, 3, 2, 4, 2, 5],             // index % 8
            third: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]        // index % 10
        )
        
        var scores = [1: 0, 2: 0, 3: 0]
        
        // 문제수만큼 반복
        for i in 0..<answers.count {
            // 수포자별 찍는 배열 반복하기
            // 정답과 일치할 때 +1
            if answers[i] == students.first[i % 5] {
                scores[1]! += 1
            }
            if answers[i] == students.second[i % 8] {
                scores[2]! += 1
            }
            if answers[i] == students.third[i % 10] {
                scores[3]! += 1
            }
        }
        // 정답 갯수가 배열 전체 최댓값과 일치하는 수포자 명단
        // 수포자 명단을 오름차순으로 정렬
        return scores.filter { $0.value == scores.values.max() ?? 0 }.keys.sorted()
    }
}

