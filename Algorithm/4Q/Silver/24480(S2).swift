//
//  24480.swift
//  Algorithm
//
//  Created by 지준용 on 11/5/23.
//

import Foundation


final class BaekJoon24480 {
    func run() {
        solution()
    }
    
    private func solution() {
        let nmr = readLine()!.split(separator: " ").compactMap{ Int($0) }
        let n = nmr[0], m = nmr[1], r = nmr[2]
        var graph = [Int: [Int]]()
        
        for _ in 1...m {
            let uv = readLine()!.split(separator: " ").compactMap{ Int($0) }
            let u = uv[0], v = uv[1]
            
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        var visited = Array(repeating: 0, count: n+1)
        var count = 1
        
        func dfs(_ node: Int) {
            visited[node] = count
            
            for next in graph[node, default: []].sorted(by: >) {
                if visited[next] == 0 {
                    count += 1
                    dfs(next)
                }
            }
        }
        
        dfs(r)
        print(visited[1...].map{String($0)}.joined(separator: "\n"))
    }
}
