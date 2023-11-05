//
//  24479.swift
//  Algorithm
//
//  Created by 지준용 on 11/2/23.
//

import Foundation


final class BaekJoon24479 {
    func run() {
        solution()
    }
    
    private func solution() {
        
        let nmr = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = nmr[0], m = nmr[1], r = nmr[2] // n = 정점의 수, m = 간선의 수, r = 시작 정점
        var visited = Array(repeating: 0, count: n+1)
        var graph = [Int: [Int]]()
        
        for _ in 1...m {
            let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
            let u = uv[0], v = uv[1]
            
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var result = 1
        
        func dfs(_ node: Int) {
            visited[node] = result
            
            for next in graph[node, default: []].sorted() {
                if visited[next] == 0 {
                    result += 1
                    dfs(next)
                }
            }
        }
        
        dfs(r)
        print(visited[1...].map { String($0) }.joined(separator: "\n"))
    }
}
