//
//  1260.swift
//  Algorithm
//
//  Created by 지준용 on 11/8/23.
//

import Foundation


final class BaekJoon1260 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nmv = readLine()!.split(separator: " ").compactMap{ Int($0) }
        let (n, m, v) = (nmv[0], nmv[1], nmv[2])
        var graph = [Int: [Int]]()
        
        for _ in 0..<m {
            let uv = readLine()!.split(separator: " ").compactMap{ Int($0) }
            let u = uv[0], v = uv[1]
            
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var visited = Array(repeating: 0, count: n+1)
        var (dfsTurn, bfsTurn) = (1, 1)
        var dfsResult = [v]
        var bfsResult = [v]
        
        dfs(v)
        print(dfsResult.map { String($0) }.joined(separator: " "))
        
        var queue = [v]
        visited = Array(repeating: 0, count: n+1)
        
        bfs(v)
        print(bfsResult.map { String($0) }.joined(separator: " "))
        
        func dfs(_ node: Int) {
            visited[node] = dfsTurn
            
            for next in graph[node, default: []].sorted() {
                if visited[next] == 0 {
                    dfsTurn += 1
                    dfsResult.append(next)
                    dfs(next)
                }
            }
        }
        
        func bfs(_ node: Int) {
            visited[node] = bfsTurn
            var index = 0
            
            while queue.count > index {
                let currentNode = queue[index]
                
                for next in graph[currentNode, default: []].sorted() {
                    if visited[next] == 0 {
                        bfsTurn += 1
                        visited[next] = bfsTurn
                        bfsResult.append(next)
                        queue.append(next)
                    }
                }
                index += 1
            }
        }
    }
}
