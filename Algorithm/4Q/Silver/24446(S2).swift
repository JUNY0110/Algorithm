//
//  24446.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon24446 {
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
        var depth = 0
        
        func bfs(_ node: Int) {
            var queue = [(node: node, depth: depth)]
            var index = 0
            visited[node] = depth
            
            while queue.count > index {
                let currentNode = queue[index].node
                depth = queue[index].depth
                visited[currentNode] = depth
                
                
                for next in graph[currentNode, default: []].sorted(by: <) {
                    if visited[next] == -1 {
                        visited[next] = depth + 1
                        queue.append((next, depth+1))
                    }
                }
                
                index += 1
            }
        }
        bfs(r)
        
        print(visited[1...].map { String($0) }.joined(separator: "\n"))
    }
}
