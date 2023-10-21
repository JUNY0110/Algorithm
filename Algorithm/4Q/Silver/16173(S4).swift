//
//  16173.swift
//  Algorithm
//
//  Created by 지준용 on 10/21/23.
//

import Foundation


final class BaekJoon16173 {
    func run() {
        solution()
    }
    
    private func solution() {
        let n = Int(readLine()!)!
        var board = [[Int]]()
        
        for _ in 0..<n {
            let jumps = readLine()!.split(separator: " ").compactMap { Int($0) }
            board.append(jumps)
        }

        var visited = Array(repeating: Array(repeating: false, count: n), count: n)

        func dfs(_ x: Int, _ y: Int) {
            visited[y][x] = true
            
            let dx = [board[y][x], 0]
            let dy = [0, board[y][x]]
            
            for i in 0..<2 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0..<n) ~= nx && (0..<n) ~= ny && visited[ny][nx] == false {
                    dfs(nx, ny)
                }
            }
        }
        dfs(0,0)

        print(visited[n-1][n-1] ? "HaruHaru" : "Hing")
    }
}
