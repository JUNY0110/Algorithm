//
//  24483.swift
//  Algorithm
//
//  Created by 지준용 on 11/5/23.
//

import Foundation


final class BaekJoon24483 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nmr = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nmr[0], m = nmr[1], r = nmr[2]
        var graph = [Int: [Int]]()
        
        for _ in 1...m {
            let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
            let u = uv[0], v = uv[1]
            
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var visited = Array(repeating: (depth: -1, turn: 0), count: n+1)
        
        var turn = 1
        
        func dfs(_ node: Int, _ depth: Int) {
            visited[node] = (depth: depth, turn: turn)
            
            for next in graph[node,default: []].sorted(by: <) {
                if visited[next] == (depth: -1, turn: 0) {
                    turn += 1
                    dfs(next, depth+1)
                }
            }
        }

        dfs(r, 0)
        
        print(visited[1...].map { Int($0.depth * $0.turn) }.reduce(0, +))
    }
}
