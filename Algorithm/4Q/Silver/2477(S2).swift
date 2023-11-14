//
//  2477.swift
//  Algorithm
//
//  Created by 지준용 on 11/14/23.
//

import Foundation


final class BaekJoon2477 {
    func run() {
        solution()
    }
    
    private func solution() {
        enum Direction: Int {
            case east = 1
            case west = 2
            case south = 3
            case north = 4
        }
        
        let k = Int(readLine()!)! // 1m^2당 참외 갯수
        var round = [Direction: [Int]]()
        var lines = [(direction: Direction, distance: Int)]()
        var result = 0
        
        for _ in 0..<6 {
            let condition = readLine()!.split(separator: " ").compactMap { Int($0) }
            guard let direction = Direction(rawValue: condition[0]) else { continue } // 1 = 동, 2 = 서, 3 = 남, 4 = 북, 반시계방향
            let distance = condition[1]
            lines.append((direction, distance))
            round[direction, default: []].append(distance)
        }
        
        var bigSquare = 1
        var smallSquare = 1
        
        for i in 0..<6 {
            let direction = lines[i].direction
            
            if round[direction]!.count == 1 {
                bigSquare *= lines[i].distance
                continue
            }
            
            if lines[i].direction == lines[(i+2) % 6].direction {
                smallSquare *= lines[(i+1) % 6].distance
            }
        }
        result = bigSquare - smallSquare
        print(result * k)
    }
}
