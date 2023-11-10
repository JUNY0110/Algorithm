//
//  24445.swift
//  Algorithm
//
//  Created by 지준용 on 11/7/23.
//

import Foundation


final class BaekJoon24445 {
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

        var visited = Array(repeating: 0, count: n+1)
        var turn = 1

        func bfs(_ node: Int) {
            visited[node] = turn
            var queue = [node]
            var index = 0

            while queue.count > index {
                let currentNode = queue[index]

                for next in graph[currentNode, default: []].sorted(by: >) {
                    if visited[next] == 0 {
                        turn += 1
                        visited[next] = turn
                        queue.append(next)
                    }
                }

                index += 1
            }
        }
        bfs(r)

        print(visited[1...].map { String($0) }.joined(separator: "\n"))
    }
}
