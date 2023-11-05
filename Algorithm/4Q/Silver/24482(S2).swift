//
//  24482.swift
//  Algorithm
//
//  Created by 지준용 on 11/5/23.
//

import Foundation


final class BaekJoon24482 {
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
        
        var visited = Array(repeating: -1, count: n+1)
        
        func dfs(_ node: Int, _ depth: Int) {
            visited[node] = depth
            
            for next in graph[node, default: []].sorted(by: >) {
                if visited[next] == -1 {
                    dfs(next, depth + 1)
                }
            }
        }
        dfs(r, 0)
        
        print(visited[1...].map { String($0) }.joined(separator: "\n"))
    }
}
