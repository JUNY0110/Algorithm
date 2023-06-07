//
//  main.swift
//  Programmers
//
//  Created by 지준용 on 2023/06/07.
//

import Foundation

let main = Main()

main.run()

class Main {
    
    func run() {
        let n = Int(readLine()!)!
        print(solution2(n))
    }
    
    
    func solution1(_ n:Int) -> [[Int]] {
        var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
        let move = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var (px, py, index) = (0, 0, 0)
        var (npx, npy) = (0, 0)
        
        
        for i in 1...(n * n) {
            arr[px][py] = i
            
            npx = px + move[index][0]
            npy = py + move[index][1]
            
            if (npy >= n) || (npx >= n) || (npy < 0) || (npx < 0) || arr[npx][npy] != 0 {
                index = (index+1) % 4
                
                npx = px + move[index][0]
                npy = py + move[index][1]
            }
            px = npx
            py = npy
        }
        
        return arr
    }
    
    func solution2(_ n:Int) -> [[Int]] {
        var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
        var (y, x) = (0, 0)
        
        for i in 1...(n * n) {
            arr[y][x] = i
            
            // 오른쪽으로가자~
            if (x+1 < n) && (arr[y][x+1] == 0) {
                // 오른쪽으로 움직일 수 있는 조건만들기
                if (y-1 >= 0) && (arr[y-1][x] == 0) {
                    y -= 1
                    continue
                }
                x += 1
                continue
            }
            
            // 내려가자~
            if (arr[y][x] != 0) && (y+1 < n) && (arr[y+1][x] == 0) {
                y += 1
                continue
            }
            
            // 왼쪽으로 가자~
            if (arr[y][x] != 0) && (x-1 >= 0) && (arr[y][x-1] == 0) {
                x -= 1
                continue
            }
            
            // 다시 올라가자~
            if (arr[y][x] != 0) && (y-1 >= 0) && arr[y-1][x] == 0 {
                y -= 1
                continue
            }
        }
        return arr
    }
}
