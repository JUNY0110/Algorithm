//
//  21608.swift
//  Algorithm
//
//  Created by 지준용 on 7/2/24.
//

import Foundation


final class BaekJoon21608 {
    func run() {
        solution()
    }
    
    // MARK: - 상어 초등학교(구현)
    private func solution() {
        let n = Int(readLine()!)!
        let totalStudent = n * n

        var classroom = Array(repeating: Array(repeating: 0, count: n), count: n)
        var studentDict = [Int: [Int]]()

        let dx = [0, -1, 1, 0]
        let dy = [-1, 0, 0, 1]

        for _ in 1...totalStudent {
            let student = readLine()!.split(separator: " ").compactMap { Int($0) }
            let number = student[0]
            let likeNumbers = Array(student[1...])

            studentDict[number] = likeNumbers

            var maxLike = -1
            var maxEmpty = -1
            var (row, col) = (0, 0)

            for r in 0..<n {
                for c in 0..<n where classroom[r][c] == 0 { // 앉을 수 있는 자리 중,
                    let (likeStudentCount, emptySeatCount) = countLikeAndEmptyNumber(r, c, likeNumbers)

                    if maxLike < likeStudentCount {
                        maxLike = likeStudentCount
                        maxEmpty = emptySeatCount

                        row = r
                        col = c

                        continue
                    }

                    if maxLike == likeStudentCount && maxEmpty < emptySeatCount {
                        maxLike = likeStudentCount
                        maxEmpty = emptySeatCount

                        row = r
                        col = c
                    }
                }
            }

            classroom[row][col] = number
        }

        var sum = 0

        for r in 0..<n {
            for c in 0..<n {
                guard let likeNumbers = studentDict[classroom[r][c]] else { continue }
                let count = countLikeAndEmptyNumber(r, c, likeNumbers)
                sum += calculateSatisfaction(count.likeCount)
            }
        }
        print(sum)

        func isValidSeat(_ r: Int, _ c: Int) -> Bool {
            if r < 0 || c < 0 || r >= n || c >= n {
                return false
            }
            return true
        }

        func checkLikeStudentNumber(_ r: Int, _ c: Int, _ likeNumbers: [Int]) -> Bool {
            if likeNumbers.contains(classroom[r][c]) {
                return true
            }
            return false
        }

        func checkEmptySeatNumber(_ r: Int, _ c: Int) -> Bool {
            if classroom[r][c] == 0 {
                return true
            }
            return false
        }

        func countLikeAndEmptyNumber(_ r: Int, _ c: Int, _ likeNumbers: [Int]) -> (likeCount: Int, emptyCount: Int){
            var likeCount = 0
            var emptyCount = 0

            for i in 0..<4 { // 해당 자리의,
                let ny = dy[i] + r
                let nx = dx[i] + c

                if !isValidSeat(ny, nx) { continue } // 교실 밖이아닌 인근 자리 내에서

                if checkLikeStudentNumber(ny, nx, likeNumbers) { // 좋아하는 학생 수 확인
                    likeCount += 1
                }

                if checkEmptySeatNumber(ny, nx) { // 빈자리 개수 확인
                    emptyCount += 1
                }
            }

            return (likeCount, emptyCount)
        }

        func calculateSatisfaction(_ satisfaction: Int) -> Int {
            let satisfactions = [0, 1, 10 ,100, 1000]

            return satisfactions[satisfaction]
        }
    }
}

