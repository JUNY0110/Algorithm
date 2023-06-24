//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/24.
//

import Foundation

class Main {
    func run() {
//        let orders = readLine()!.split(separator: " ").map { String($0) }
//        let course = readLine()!.split(separator: " ").compactMap{Int($0)}
    }

    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        let blockType = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) } // 블록 종류
        var board = board.map { String($0).map { String($0) } }         // 전체블록 만들기
        var answer = 0
        
        while true {
            var beforeBoard = board
            
            for t in blockType {
                // 블록 타입별 2*2블록 생성
                let doubleSquare = Array(repeating: Array(repeating: t, count: 2), count: 2)
                var memory = Set<[Int]>()

                // 전체 블록에서 2*2사이즈만큼 확인
                for i in 0..<m-1 {
                    for j in 0..<n-1 {
                        let up = (doubleSquare[0][0] == board[i][j])
                                && (doubleSquare[0][1] == board[i][j+1])
                        let down = (doubleSquare[1][0] == board[i+1][j])
                                && (doubleSquare[1][1] == board[i+1][j+1])

                        // 2*2블록만큼 일치하면, 해당 블록 위치를 기록.
                        // 같은 위치가 중복 저장되지 않도록 Set 사용.
                        if up && down {
                            memory.formUnion([[i,j], [i,j+1], [i+1,j], [i+1,j+1]])
                        }
                    }
                }

                // 블록 지우기
                for r in memory {
                    board[r[0]][r[1]] = "-"
                    answer += 1
                }
            }
            // 블록을 위에서 아래로 내리는 조건 = 아래에 빈칸이 있어야 한다.
            // 즉, 블록은 아래에서부터 확인해야함.
            for i in stride(from: m-1, through: 0, by: -1) {
                for j in stride(from: n-1, through: 0, by: -1) {
                    if (i != 0) && (board[i][j] == "-") {
                        var up = i-1
                        
                        while (up >= 0)  && (board[i][j] == "-") {
                            // 상단블록이 빈블록인지 확인
                            if board[up][j] == "-" {
                                up -= 1
                                continue
                            }
                            // "-"(빈 블록)이 아닌 상단 블록과 교체
                            board[i][j] = board[up][j]
                            board[up][j] = "-"
                        }
                    }
                }
            }
            
            if beforeBoard == board {  break  }
        }
        
        return answer
    }
}
